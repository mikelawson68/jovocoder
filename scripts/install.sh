#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/critic/jovocoder"
BIN="/home/critic/bin"
MEM="/home/critic/.mempalace"

mkdir -p "$BIN" "$MEM"

install -m 0755 "$ROOT/bin/jovocoder" "$BIN/jovocoder"

touch "$MEM/mp-agent-history.txt"
touch "$MEM/mp-agent-tasks.jsonl"
touch "$MEM/mp-agent-memory.log"

echo "Installed JovoCoder"
echo "Run: /home/critic/bin/jovocoder"
