#!/usr/bin/env bash
# Downloads the newest zip of every Mix System plugin for one OS (macOS | Windows) into dl/<os>/
# and unpacks it into stage/<os>/<ZipPrefix>/. Writes versions.txt (prefix version name).
set -euo pipefail
OS="$1"; BR="downloads-$(echo "$OS" | tr 'A-Z' 'a-z')"
mkdir -p "dl/$OS" "stage/$OS"
: > "versions-$OS.txt"
grep -v '^#' plugins.txt | while read -r repo prefix rest; do
  [ -n "$repo" ] || continue
  name=$(echo "$rest" | awk -F'  +' '{print $1}')
  zip=$(curl -fsSL "https://api.github.com/repos/etoney/$repo/contents?ref=$BR" -H "Authorization: Bearer ${GITHUB_TOKEN:-}" \
        | python3 -c "import json,sys; print([f['name'] for f in json.load(sys.stdin) if f['name'].endswith('.zip')][0])")
  ver=$(echo "$zip" | sed -E 's/.*-v([0-9.]+)-.*/\1/')
  echo "$repo: $zip"
  curl -fsSL -o "dl/$OS/$zip" -H "Accept: application/vnd.github.raw" -H "Authorization: Bearer ${GITHUB_TOKEN:-}" \
       "https://api.github.com/repos/etoney/$repo/contents/$zip?ref=$BR"
  (cd "stage/$OS" && unzip -q -o "../../dl/$OS/$zip")
  [ -d "stage/$OS/$prefix" ] || { echo "::error::$zip has no $prefix/ folder"; exit 1; }
  echo "$prefix $ver $name" >> "versions-$OS.txt"
done
cat "versions-$OS.txt"
