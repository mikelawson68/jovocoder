#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="${HOME}/bin"
MEMORY_DIR="${HOME}/.mempalace"

echo "Installing JovoCoder from: $ROOT_DIR"

command -v python3 >/dev/null 2>&1 || { echo "missing python3"; exit 1; }
command -v bash >/dev/null 2>&1 || { echo "missing bash"; exit 1; }
command -v ollama >/dev/null 2>&1 || {
  echo "missing ollama"
  echo "Install Ollama first, then re-run this script."
  exit 1
}

mkdir -p "$BIN_DIR" "$MEMORY_DIR"
install -m 0755 "$ROOT_DIR/bin/jovocoder" "$BIN_DIR/jovocoder"
touch "$MEMORY_DIR/mp-agent-history.txt"
touch "$MEMORY_DIR/mp-agent-tasks.jsonl"
touch "$MEMORY_DIR/mp-agent-memory.log"

echo "JovoCoder installed to: $BIN_DIR/jovocoder"
if command -v mempalace >/dev/null 2>&1; then
  echo "MemPalace detected; memory-backed recall is available."
else
  echo "MemPalace not detected; core execution and audit paths remain available."
fi
