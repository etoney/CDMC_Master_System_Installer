#!/usr/bin/env bash
# Sends the signed .pkg to Apple's notary service and staples the ticket, so macOS opens it with no warning.
#   NOTARY_KEY_P8 (base64 of the App Store Connect API key .p8), NOTARY_KEY_ID, NOTARY_ISSUER_ID
# If Apple rejects it, the notary log is printed: it names every file that failed and why.
set -euo pipefail
PKG="CDMC_master_system_installer-macOS.pkg"
KEY="$RUNNER_TEMP/notary.p8"
trap 'rm -f "$KEY"' EXIT
echo "$NOTARY_KEY_P8" | base64 --decode > "$KEY"
AUTH=(--key "$KEY" --key-id "$NOTARY_KEY_ID" --issuer "$NOTARY_ISSUER_ID")
xcrun notarytool submit "$PKG" "${AUTH[@]}" --wait --timeout 30m --output-format json | tee notary.json
echo
STATUS=$(python3 -c "import json; print(json.load(open('notary.json')).get('status', 'unknown'))")
SUB=$(python3 -c "import json; print(json.load(open('notary.json')).get('id', ''))")
echo "notary: $STATUS ($SUB)"
if [ "$STATUS" != "Accepted" ]; then
  echo "::error::Apple's notary service answered $STATUS. Its log follows."
  [ -n "$SUB" ] && xcrun notarytool log "$SUB" "${AUTH[@]}" || true
  exit 1
fi
xcrun stapler staple "$PKG"
xcrun stapler validate "$PKG"
spctl --assess --type install -vv "$PKG"
