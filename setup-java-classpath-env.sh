#!/bin/bash

# Identify shell
SHELL_NAME=$(basename "$SHELL")

# Determine config file
case "$SHELL_NAME" in
  bash)
    RC_FILE="$HOME/.bashrc"
    ;;
  zsh)
    RC_FILE="$HOME/.zshrc"
    ;;
  *)
    echo "Unsupported shell: $SHELL_NAME"
    exit 1
    ;;
esac

# Find Java path
JAVA_BIN_PATH=$(readlink -f "$(which java)" 2>/dev/null)
if [ -z "$JAVA_BIN_PATH" ]; then
  echo "Error: 'java' not found in PATH. Please install Java first."
  exit 1
fi

JAVA_HOME=$(dirname "$(dirname "$JAVA_BIN_PATH")")

# Backup config
cp "$RC_FILE" "${RC_FILE}.backup"

# Clean up old entries
sed -i '/JAVA_HOME/d' "$RC_FILE"
sed -i '/java\/bin/d' "$RC_FILE"

# Add new entries
echo "" >> "$RC_FILE"
echo "# Java settings" >> "$RC_FILE"
echo "export JAVA_HOME=\"$JAVA_HOME\"" >> "$RC_FILE"
echo "export PATH=\"\$JAVA_HOME/bin:\$PATH\"" >> "$RC_FILE"

# Apply changes
source "$RC_FILE"

echo "✅ Updated PATH and JAVA_HOME for $SHELL_NAME"
echo "   Java home: $JAVA_HOME"
echo "   PATH now includes: \$JAVA_HOME/bin"

echo "displaying which java"
which java
echo "displaying which version"
java -version
# Run Java 
echo "running Java application"
java HelloWorld.java 