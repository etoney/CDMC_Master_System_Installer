#!/usr/bin/env bash
# Developer ID signing, used only when the Apple secrets are set in the repo (otherwise the build stays ad-hoc signed).
#   MACOS_CERT_APP_P12        base64 of the "Developer ID Application" certificate + key (.p12)
#   MACOS_CERT_INSTALLER_P12  base64 of the "Developer ID Installer" certificate + key (.p12)
#   MACOS_CERT_PASSWORD       the password the .p12 files were exported with
# Makes a throwaway keychain, signs every plug-in bundle in stage/macOS with the hardened runtime and a
# secure timestamp (what notarization needs), and writes the installer identity to build-mac/installer-identity.
set -euo pipefail
KC="$RUNNER_TEMP/cdmc-signing.keychain-db"
KCPW=$(openssl rand -hex 16)
security create-keychain -p "$KCPW" "$KC"
security set-keychain-settings -lut 3600 "$KC"
security unlock-keychain -p "$KCPW" "$KC"
for v in MACOS_CERT_APP_P12 MACOS_CERT_INSTALLER_P12; do
  echo "${!v}" | base64 --decode > "$RUNNER_TEMP/$v.p12"
  security import "$RUNNER_TEMP/$v.p12" -k "$KC" -P "$MACOS_CERT_PASSWORD" -T /usr/bin/codesign -T /usr/bin/productbuild -T /usr/bin/productsign
  rm -f "$RUNNER_TEMP/$v.p12"
done
security set-key-partition-list -S apple-tool:,apple: -s -k "$KCPW" "$KC" >/dev/null
security list-keychains -d user -s "$KC" $(security list-keychains -d user | tr -d '"')
APP_ID=$(security find-identity -v -p codesigning "$KC" | awk -F'"' '/Developer ID Application/{print $2; exit}')
INST_ID=$(security find-identity -v "$KC" | awk -F'"' '/Developer ID Installer/{print $2; exit}')
[ -n "$APP_ID" ] || { echo "::error::no Developer ID Application identity in MACOS_CERT_APP_P12"; exit 1; }
[ -n "$INST_ID" ] || { echo "::error::no Developer ID Installer identity in MACOS_CERT_INSTALLER_P12"; exit 1; }
echo "Signing as: $APP_ID / $INST_ID"
find stage/macOS -maxdepth 3 \( -name "*.vst3" -o -name "*.component" \) -prune | while read -r b; do
  xattr -cr "$b"
  codesign --force --deep --options runtime --timestamp --sign "$APP_ID" "$b"
  codesign --verify --deep --strict "$b"
  echo "  signed $(basename "$b")"
done
mkdir -p build-mac
echo "$INST_ID" > build-mac/installer-identity
echo "$KC" > build-mac/keychain
