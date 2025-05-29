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

# List of required Java versions
declare -a JAVA_VERSIONS=("11.0.27-tem" "17.0.15-tem" "21.0.6-tem")

for version in "${JAVA_VERSIONS[@]}"; do
    echo ""
    if sdk list java | grep -q "$version"; then
        echo "✅ Java $version is already installed."
    else
        echo "📥 Installing Java $version via SDKMAN..."
        echo y | sdk install java "$version"
    fi
     # Delay to ensure installation finishes and environment settles
    echo "⏳ Waiting 5 seconds to ensure Java $version setup completes..."
    sleep 5
done

echo "displaying all the installed java versions.."
sdk list java | grep "installed"

# Set Java 21 as default
#echo ""
#echo "⚙️ Setting Java 21.0.6 (tem) as default..."
#sdk use java 21.0.6-tem

# Dynamically determine Java installation path
# Dynamically set JAVA_HOME based on current java executable
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed or not in PATH"
    exit 1
fi

JAVA_BIN=$(which java)
JAVA_REAL_PATH=$(readlink -f "$JAVA_BIN")
JAVA_HOME_PATH=$(dirname "$(dirname "$JAVA_REAL_PATH")")

# Update PATH dynamically using detected path
export JAVA_HOME="$JAVA_HOME_PATH"
export PATH="$JAVA_HOME/bin:$PATH"

echo "Printing JAVA_HOME path"
echo $JAVA_HOME

#echo "Printing Path"
#echo $PATH
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
echo "📁 Current Java Version in use:"
sdk current

sdk list java | grep "installed"

sdk use java  21.0.6-tem