#!/usr/bin/env bash
set -euo pipefail

ROOT="/home/critic/jovocoder"

echo "Verifying..."

command -v ollama >/dev/null || { echo "ollama missing"; exit 1; }
command -v mempalace >/dev/null || { echo "mempalace missing"; exit 1; }

bash -n "$ROOT/bin/jovocoder"

echo "OK"
