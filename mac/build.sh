#!/usr/bin/env bash
# Builds CDMC_master_system_installer-macOS.pkg from stage/macOS (see fetch.sh). Run on macOS.
set -euo pipefail
OUT="CDMC_master_system_installer-macOS.pkg"
APPDIR="Applications/Castle Danger Music Company"
rm -rf build-mac && mkdir -p build-mac/pkgs build-mac/resources
cp mac/resources/* build-mac/resources/
cp LICENSE.txt build-mac/resources/license.txt

choices=""; outline=""; refs=""
add_component () {   # id title description version root [required]
  local id="$1" title="$2" desc="$3" ver="$4" root="$5" required="${6:-no}"
  local plist="build-mac/$id.plist" scripts="build-mac/scripts-$id"
  xattr -cr "$root" 2>/dev/null || true
  # bundles must install where we say, not wherever an older copy happens to sit
  pkgbuild --analyze --root "$root" "$plist" >/dev/null
  i=0; while /usr/libexec/PlistBuddy -c "Print :$i" "$plist" >/dev/null 2>&1; do
    /usr/libexec/PlistBuddy -c "Set :$i:BundleIsRelocatable false" "$plist" 2>/dev/null \
      || /usr/libexec/PlistBuddy -c "Add :$i:BundleIsRelocatable bool false" "$plist"
    i=$((i+1)); done
  # postinstall: clear quarantine on exactly what this component installed, refresh the AU cache
  mkdir -p "$scripts"
  {
    echo '#!/bin/bash'
    (cd "$root" && find . -maxdepth 6 \( -name "*.vst3" -o -name "*.component" -o -name "*.txt" -o -name "*.pdf" \) -prune -print) | sed 's|^\./||' | while read -r p; do
      echo "/usr/bin/xattr -dr com.apple.quarantine \"/$p\" 2>/dev/null"
    done
    echo '/usr/bin/killall -9 AudioComponentRegistrar 2>/dev/null'
    echo 'exit 0'
  } > "$scripts/postinstall"
  chmod +x "$scripts/postinstall"
  pkgbuild --root "$root" --component-plist "$plist" --scripts "$scripts" --identifier "com.castledanger.mixsystem.$id" \
           --version "$ver" --install-location / "build-mac/pkgs/$id.pkg" >/dev/null
  local enabled="true" sel="true"
  [ "$required" = "yes" ] && enabled="false"
  outline+="        <line choice=\"$id\"/>"$'\n'
  choices+="    <choice id=\"$id\" title=\"$title\" description=\"$desc\" start_selected=\"$sel\" enabled=\"$enabled\"><pkg-ref id=\"com.castledanger.mixsystem.$id\"/></choice>"$'\n'
  refs+="    <pkg-ref id=\"com.castledanger.mixsystem.$id\" version=\"$ver\" onConclusion=\"none\">$id.pkg</pkg-ref>"$'\n'
  echo "  $title $ver"
}

# guides (always installed)
root=build-mac/root-guides; mkdir -p "$root/$APPDIR/Guides"
cp "docs/Mix System User Guide.pdf" "$root/$APPDIR/Guides/"
add_component guides "User guide" "The Mix System user guide (PDF), plus each plugin's quick guide." "1.1" "$root" yes

while read -r prefix ver name; do
  src="stage/macOS/$prefix"
  desc=$(grep -v '^#' plugins.txt | awk -v p="$prefix" '$2==p' | awk -F'  +' '{print $NF}' | sed 's/&/and/g')
  root="build-mac/root-$prefix"
  mkdir -p "$root/Library/Audio/Plug-Ins/VST3" "$root/Library/Audio/Plug-Ins/Components" "$root/$APPDIR/Guides"
  cp -R "$src"/VST3/*.vst3 "$root/Library/Audio/Plug-Ins/VST3/"
  cp -R "$src"/AU/*.component "$root/Library/Audio/Plug-Ins/Components/"
  cp "$src/controls.txt" "$root/$APPDIR/Guides/$name - controls.txt"
  add_component "$(echo "$prefix" | tr 'A-Z' 'a-z')" "$name" "$desc. Version $ver: VST3 and AU." "$ver" "$root"
done < versions-macOS.txt

cat > build-mac/distribution.xml <<XML
<?xml version="1.0" encoding="utf-8"?>
<installer-gui-script minSpecVersion="2">
    <title>Castle Danger Music Company: Mix System ${PKG_VER:-}</title>
    <organization>com.castledanger</organization>
    <welcome file="welcome.html" mime-type="text/html"/>
    <license file="license.txt"/>
    <conclusion file="conclusion.html" mime-type="text/html"/>
    <options customize="always" require-scripts="false" hostArchitectures="arm64,x86_64" rootVolumeOnly="true"/>
    <domains enable_localSystem="true"/>
    <volume-check><allowed-os-versions><os-version min="11.0"/></allowed-os-versions></volume-check>
    <choices-outline>
$outline    </choices-outline>
$choices$refs</installer-gui-script>
XML
SIGN=()
if [ -f build-mac/installer-identity ]; then SIGN=(--sign "$(cat build-mac/installer-identity)" --keychain "$(cat build-mac/keychain)" --timestamp); fi
productbuild --distribution build-mac/distribution.xml --resources build-mac/resources --package-path build-mac/pkgs ${SIGN[@]+"${SIGN[@]}"} "$OUT"
ls -la "$OUT"
