#!/bin/bash

# Try to find the correct settings directory
SETTINGS_DIR=""

# 1. Check for VS Code / Gitpod (.vscode-server)
if [ -d "$HOME/.vscode-server" ]; then
  SETTINGS_DIR="$HOME/.vscode-server/data/Machine"
elif [ -d "$HOME/.local/share/code-server" ]; then
  # 2. Check for code-server (common Linux install path)
  SETTINGS_DIR="$HOME/.local/share/code-server/User/globalStorage/ms-vscode-remote.remote-ssh-explorer/vscode-machine/settings"
elif [ -n "$(command -v code-server)" ]; then
  # 3. Fallback for code-server using --user-data-dir (if running via CLI)
  CODE_SERVER_DATA_DIR=$(ps aux | grep code-server | grep -o "\-\-user-data-dir [^ ]*" | awk '{print $2}')
  if [ -n "$CODE_SERVER_DATA_DIR" ]; then
    SETTINGS_DIR="$CODE_SERVER_DATA_DIR/Machine"
  else
    echo "⚠️ Could not find code-server data dir, using default fallback."
    SETTINGS_DIR="$HOME/.config/code-server"
  fi
else
  echo "❌ Could not detect VS Code or code-server environment."
  exit 1
fi

# Ensure the directory exists
mkdir -p "$SETTINGS_DIR"

# Write settings.json
cat <<EOF > "$SETTINGS_DIR/settings.json"
{
  "java.jdt.ls.java.home": "~/.sdkman/candidates/java/current",
  "java.configuration.runtimes": [
    {
      "name": "JavaSE-21",
      "path": "~/.sdkman/candidates/java/21.0.3-open",
      "default": true
    },
    {
      "name": "JavaSE-17",
      "path": "~/.sdkman/candidates/java/17.0.13-open"
    }
  ],
  "java.import.gradle.java.home": "~/.sdkman/candidates/java/current"
}
EOF

echo "✅ Wrote settings.json to: $SETTINGS_DIR/settings.json"