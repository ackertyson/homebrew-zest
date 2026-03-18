#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>" >&2
  echo "  e.g. $0 0.1.0" >&2
  exit 1
fi

VERSION="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE="$SCRIPT_DIR/zest.rb.template"
OUTPUT="$SCRIPT_DIR/Formula/zest.rb"

CHECKSUMS_URL="https://github.com/ackertyson/zest/releases/download/v${VERSION}/checksums.txt"

echo "Fetching checksums from $CHECKSUMS_URL ..."
CHECKSUMS=$(curl -sfL "$CHECKSUMS_URL") || {
  echo "Error: failed to fetch checksums for v${VERSION}" >&2
  exit 1
}

get_sha() {
  local pattern="$1"
  echo "$CHECKSUMS" | grep "$pattern" | awk '{print $1}'
}

SHA_AARCH64_APPLE=$(get_sha "aarch64-apple-darwin")

if [ -z "$SHA_AARCH64_APPLE" ]; then
  echo "Error: could not find aarch64-apple-darwin checksum in checksums.txt" >&2
  echo "Contents:" >&2
  echo "$CHECKSUMS" >&2
  exit 1
fi

echo "aarch64-apple-darwin: $SHA_AARCH64_APPLE"

sed \
  -e "s/@@VERSION@@/${VERSION}/g" \
  -e "s/@@SHA256_AARCH64_APPLE@@/${SHA_AARCH64_APPLE}/g" \
  "$TEMPLATE" > "$OUTPUT"

echo "Generated $OUTPUT"
