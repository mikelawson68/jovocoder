#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/critic/jovocoder"
VER="$(cat "$ROOT/VERSION")"
OUT="$ROOT/release/jovocoder-$VER.tar.gz"

mkdir -p "$ROOT/release"

# exclude release directory to avoid recursion warning
tar --exclude="./release" -czf "$OUT" -C "$ROOT" .

echo "Created $OUT"
