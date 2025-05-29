#!/bin/bash

set -e

if ! command -v direnv &> /dev/null; then
  echo "📥 Installing direnv..."
  sudo apt-get update -y > /dev/null
  sudo apt-get install -y direnv > /dev/null
  echo "✅ direnv installed."
fi

# Add direnv hook to .bashrc only if not already present
DIRENV_HOOK='eval "$(direnv hook bash)"'
if ! grep -qF -- "$DIRENV_HOOK" ~/.bashrc; then
  echo "📎 Adding direnv hook to ~/.bashrc"
  echo "$DIRENV_HOOK" >> ~/.bashrc
else
  echo "📎 direnv hook already present in ~/.bashrc"
fi

# Reload bashrc to apply changes immediately
source ~/.bashrc

echo "✅ direnv setup complete"