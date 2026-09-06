#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VER="$(cat "$ROOT/VERSION")"
OUT="$ROOT/release/jovocoder-$VER.tar.gz"

mkdir -p "$ROOT/release"

# exclude release directory to avoid recursion warning
tar --exclude="./release" -czf "$OUT" -C "$ROOT" .

echo "Created $OUT"
