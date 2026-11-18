#!/usr/bin/env bash
# Installs the pkg on the CI Mac and checks every plugin landed, universal, with no quarantine flag.
set -euo pipefail
PKG="CDMC_master_system_installer-macOS.pkg"
# an "older copy" in the user's own plug-in folder, to check it gets moved out of the way
mkdir -p "$HOME/Library/Audio/Plug-Ins/VST3/The Freak.vst3/Contents"; echo old > "$HOME/Library/Audio/Plug-Ins/VST3/The Freak.vst3/Contents/old.txt"
# an app from an older install, to check it gets removed
sudo mkdir -p "/Applications/Castle Danger Music Company/The Freak.app/Contents"
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
if ls "/Applications/Castle Danger Music Company/"*.app >/dev/null 2>&1; then echo "::error::a standalone app is still installed"; fail=1; fi
OLD="$HOME/Library/Audio/Plug-Ins Disabled/Castle Danger (older copies)/The Freak.vst3"
if [ "$(stat -f %Su /dev/console)" = "$(id -un)" ]; then
  if [ -e "$HOME/Library/Audio/Plug-Ins/VST3/The Freak.vst3" ] || [ ! -e "$OLD" ]; then echo "::error::older per-user copy not moved aside"; fail=1; else echo "older per-user copy moved to: $OLD"; fi
else echo "(no one logged in at the console on this runner: skipping the older-copy check)"; fi
exit $fail
