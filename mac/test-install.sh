#!/usr/bin/env bash
# Installs the pkg on the CI Mac and checks every plugin landed, universal, with no quarantine flag.
set -euo pipefail
PKG="CDMC_master_system_installer-macOS.pkg"
xattr -w com.apple.quarantine "0081;00000000;Safari;" "$PKG"
sudo installer -pkg "$PKG" -target / -verboseR
fail=0
while read -r prefix ver name; do
  for d in /Library/Audio/Plug-Ins/VST3 /Library/Audio/Plug-Ins/Components; do
    n=$(ls "$d" | grep -ci "$(echo "$name" | tr -d ' ')\|$name" || true)
    [ "$n" -ge 1 ] || { echo "::error::$name missing from $d"; fail=1; }
  done
done < versions-macOS.txt
ls -la /Library/Audio/Plug-Ins/VST3 /Library/Audio/Plug-Ins/Components "/Applications/Castle Danger Music Company" "/Applications/Castle Danger Music Company/Guides"
for b in /Library/Audio/Plug-Ins/VST3/*.vst3 /Library/Audio/Plug-Ins/Components/*.component; do
  bin="$b/Contents/MacOS/$(basename "${b%.*}")"
  [ -f "$bin" ] || bin=$(ls "$b"/Contents/MacOS/* | head -1)
  echo "$(basename "$b"): $(lipo -archs "$bin")"
  if xattr -lr "$b" | grep -q quarantine; then echo "::error::$b still quarantined"; fail=1; fi
done
exit $fail
