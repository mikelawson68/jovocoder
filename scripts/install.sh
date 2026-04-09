#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="${HOME}/bin"
MEM_DIR="${HOME}/.mempalace"

echo "Installing JovoCoder from: $ROOT_DIR"

command -v python3 >/dev/null 2>&1 || { echo "missing python3"; exit 1; }
command -v bash >/dev/null 2>&1 || { echo "missing bash"; exit 1; }
command -v ollama >/dev/null 2>&1 || {
  echo "missing ollama"
  echo "install Ollama first, then re-run this script"
  exit 1
}
command -v mempalace >/dev/null 2>&1 || {
  echo "missing mempalace"
  echo "install MemPalace first, then re-run this script"
  exit 1
}

mkdir -p "$BIN_DIR"
mkdir -p "$MEM_DIR"

install -m 0755 "$ROOT_DIR/bin/jovocoder" "$BIN_DIR/jovocoder"

touch "$MEM_DIR/mp-agent-history.txt"
touch "$MEM_DIR/mp-agent-tasks.jsonl"
touch "$MEM_DIR/mp-agent-memory.log"

if [ ! -f "$MEM_DIR/identity.txt" ]; then
  cat > "$MEM_DIR/identity.txt" << 'EOT'
Local-first AI runtime.
Use memory and retrieval as authoritative context when available.
Prefer safe, verifiable actions.
Do not hallucinate success.
EOT
fi

echo
echo "Install complete."
echo "Binary installed to: $BIN_DIR/jovocoder"
echo

case ":$PATH:" in
  *":$BIN_DIR:"*)
    echo "Run with: jovocoder"
    ;;
  *)
    echo "$BIN_DIR is not currently in PATH."
    echo "Run with: $BIN_DIR/jovocoder"
    echo
    echo "To add it for future shells:"
    echo "  echo 'export PATH=\"\$HOME/bin:\$PATH\"' >> \"\$HOME/.bashrc\""
    ;;
esac
