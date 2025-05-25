#!/bin/bash

# Source SDKMAN
export SDKMAN_DIR="/home/vscode/.sdkman"
source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Get current Java paths from SDKMAN
JAVA_21_PATH=$(sdk home java 21.0.3-open)
JAVA_17_PATH=$(sdk home java 17.0.13-open)

# Define settings.json path
SETTINGS_JSON="/home/vscode/.vscode-server/data/Machine/settings.json"

# Ensure directory exists
mkdir -p "$(dirname "$SETTINGS_JSON")"

# Update settings.json with both runtimes and set Java 21 as default
cat <<EOF > "$SETTINGS_JSON"
{
  "java.jdt.ls.java.home": "$JAVA_21_PATH",
  "java.configuration.runtimes": [
    {
      "name": "JavaSE-21",
      "path": "$JAVA_21_PATH",
      "default": true
    },
    {
      "name": "JavaSE-17",
      "path": "$JAVA_17_PATH"
    }
  ],
  "java.import.gradle.java.home": "$JAVA_21_PATH"
}
EOF

echo "✅ Updated VS Code settings with Java 21 and Java 17 paths:"
echo "   Java 21: $JAVA_21_PATH"
echo "   Java 17: $JAVA_17_PATH"