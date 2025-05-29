#!/bin/bash

set -e

# Define SDKMAN_DIR
export SDKMAN_DIR="$HOME/.sdkman"

echo "🔍 Checking for SDKMAN..."

# Check if SDKMAN is already initialized
if [ -f "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Function to check if 'sdk' is available in PATH
is_sdk_available() {
    command -v sdk &> /dev/null
}

# Install SDKMAN if not found
if ! is_sdk_available; then
    echo "📎 Installing SDKMAN..."
    curl -s "https://get.sdkman.io"  | bash > /dev/null

    # Load SDKMAN environment
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Verify sdk command is now available
if ! is_sdk_available; then
    echo "❌ Failed to install or load SDKMAN."
    exit 1
else
    echo "✅ SDKMAN is now in PATH."
fi

# Ensure sudo is available
if ! command -v sudo &> /dev/null; then
    echo "❌ sudo is required"
    exit 1
fi

# Install java-common if update-java-alternatives is missing
if ! command -v update-java-alternatives &> /dev/null; then
    echo "📎 Installing java-common to get update-java-alternatives..."
    sudo