#!/usr/bin/env bash
set -e

echo "Installing JovoCoder..."

# Detect OS
OS="$(uname -s)"

# Check for Homebrew (macOS)
install_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

# Install Ollama if missing
install_ollama() {
  if command -v ollama >/dev/null 2>&1; then
    echo "Ollama already installed"
    return
  fi

  echo
  echo "Ollama not found."

  read -p "Install Ollama now? (y/n): " choice

  if [[ "$choice" != "y" ]]; then
    echo "
Install Ollama manually:
  https://ollama.com/download
Then re-run install."
    exit 1
  fi

  if [[ "$OS" == "Darwin" ]]; then
    install_brew
    brew install ollama
  else
    curl -fsSL https://ollama.com/install.sh | sh
  fi

  echo
  echo "Ollama installed."
  echo "Start it with:"
  echo "  ollama serve"
  echo
}

# Ensure ollama is installed
install_ollama

# Check if ollama is running
if ! pgrep -x "ollama" >/dev/null 2>&1; then
  echo "Ollama is not running."
  echo "Run: ollama serve"
  exit 1
fi

# Install jovocoder binary
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo cp -a "$SCRIPT_DIR/bin/jovocoder" /usr/local/bin/jovocoder
sudo chmod +x /usr/local/bin/jovocoder

echo

echo "JovoCoder installed successfully."
echo "Run it with:"
echo "  jovocoder"
echo

