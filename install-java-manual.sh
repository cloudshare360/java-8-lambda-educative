#!/bin/bash

set -e

# Install direnv if not already installed
if ! command -v direnv &> /dev/null; then
    echo "📎 Installing direnv..."
    sudo apt-get update > /dev/null
    sudo apt-get install -y direnv > /dev/null
fi

# Add direnv hook to bashrc if not already present
if ! grep -q 'eval "$(direnv hook bash)"' ~/.bashrc; then
    echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
    source ~/.bashrc
    echo "📎 direnv hook added to ~/.bashrc"
else
    echo "✅ direnv hook already in ~/.bashrc"
fi

# Install SDKMAN if missing
if [ ! -d "$HOME/.sdkman" ]; then
    echo "📎 Installing SDKMAN..."
    curl -s "https://get.sdkman.io"  | bash > /dev/null
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Load SDKMAN environment
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Ensure SDKMAN is up to date
echo "🔄 Updating SDKMAN..."
sdk selfupdate force

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
    echo "📌 Updated .bashrc with JAVA_HOME and PATH"
    source "$HOME/.bashrc"
elif [[ -f "$HOME/.zshrc" ]]; then
    echo 'export JAVA_HOME="$HOME/.sdkman/candidates/java/current"' >> "$HOME/.zshrc"
    echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> "$HOME/.zshrc"
    echo "📌 Updated .zshrc with JAVA_HOME and PATH"
    source "$HOME/.zshrc"
fi

# Final verification
echo ""
echo "✅ Java -version output:"
java -version

echo ""
echo "🔗 Resolved Java Binary Path (readlink -f \$(which java)):"
readlink -f $(which java)

echo ""
echo "📁 JAVA_HOME set to:"
echo "$JAVA_HOME"