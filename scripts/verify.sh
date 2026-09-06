#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "Verifying..."

command -v bash >/dev/null || { echo "bash missing"; exit 1; }
command -v python3 >/dev/null || { echo "python3 missing"; exit 1; }
command -v ollama >/dev/null || { echo "ollama missing"; exit 1; }

bash -n "$ROOT_DIR/bin/jovocoder"
bash -n "$ROOT_DIR/scripts/install.sh"

if command -v mempalace >/dev/null 2>&1; then
  echo "MemPalace: available"
else
  echo "MemPalace: optional and not installed"
fi

echo "OK"
