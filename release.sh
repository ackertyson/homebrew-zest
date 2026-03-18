#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <version>" >&2
  echo "  e.g. $0 0.1.0" >&2
  exit 1
fi

VERSION="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"$SCRIPT_DIR/update.sh" "$VERSION"

cd "$SCRIPT_DIR"
git add Formula/zest.rb
git commit -m "zest ${VERSION}"
git tag -a "v${VERSION}" -m "zest ${VERSION}"
git push origin main --tags

echo "Released v${VERSION}"
