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

# Define SDKMAN_DIR
export SDKMAN_DIR="$HOME/.sdkman"

# Source SDKMAN if already initialized
if [ -f "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

echo "🔍 Checking for SDKMAN..."

# Install SDKMAN if not found
if ! command -v sdk &> /dev/null; then
    echo "📎 Installing SDKMAN..."
    curl -s "https://get.sdkman.io"  | bash > /dev/null
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Verify sdk command is now available
if ! command -v sdk &> /dev/null; then
    echo "❌ Failed to install or load SDKMAN."
    exit 1
else
    echo "✅ SDKMAN is now in PATH."
fi

# List of required Java versions
declare -a JAVA_VERSIONS=("11.0.27-tem" "17.0.15-tem" "21.0.6-tem")

for version in "${JAVA_VERSIONS[@]}"; do
    echo ""
    if sdk list java | grep -q "$version"; then
        echo "✅ Java $version is already installed."
    else
        echo "📥 Installing Java $version via SDKMAN..."
        sdk install java "$version"
    fi
done

# Set Java 21 as default
echo ""
echo "⚙️ Setting Java 21.0.6 (tem) as default..."
sdk default java 21.0.6-tem

# Dynamically determine Java installation path
JAVA_HOME_PATH="$HOME/.sdkman/candidates/java/current"

# Update PATH dynamically using detected path
export JAVA_HOME="$JAVA_HOME_PATH"
export PATH="$JAVA_HOME/bin:$PATH"

# Optional: Add to shell config for persistence
if [[ -f "$HOME/.bashrc" ]]; then
    echo 'export JAVA_HOME="$HOME/.sdkman/candidates/java/current"' >> "$HOME/.bashrc"
    echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
elif [[ -f "$HOME/.zshrc" ]]; then
    echo 'export JAVA_HOME="$HOME/.sdkman/candidates/java/current"' >> "$HOME/.zshrc"
    echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> "$HOME/.zshrc"
    source "$HOME/.zshrc"
fi

# Final verification
echo ""
echo "📌 Installed Java Versions:"
sdk list java | grep "installed"

echo ""
echo "📌 Current Default Java Version:"
sdk use java 21.0.6-tem

echo ""
echo "✅ Java -version output:"
java -version

echo ""
echo "🔗 Resolved Java Binary Path (readlink -f \$(which java)):"
readlink -f $(which java)

echo ""
echo "📁 JAVA_HOME set to:"
echo "$JAVA_HOME"