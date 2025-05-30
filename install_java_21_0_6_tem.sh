#!/bin/bash

# Step 1: Define SDKMAN directory
export SDKMAN_DIR="$HOME/.sdkman"

# Step 2: Check if SDKMAN is installed; install if missing
if [ ! -d "$SDKMAN_DIR" ]; then
    echo "SDKMAN not found. Installing SDKMAN..."
    curl -s "https://get.sdkman.io"  | bash
    
    # Source SDKMAN initialization script
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
else
    echo "SDKMAN already installed. Sourcing SDKMAN..."
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Step 3: Define target version
CANDIDATE="java"
TARGET_VERSION="21.0.6-tem"

echo -e "\n🔍 Checking for Java $TARGET_VERSION..."

# Check if version is available
AVAILABLE=$(sdk list $CANDIDATE | grep -i "$TARGET_VERSION")

if [ -z "$AVAILABLE" ]; then
    echo "❌ Java version $TARGET_VERSION is not available in SDKMAN."
    echo "Please verify the identifier using 'sdk list java'"
    exit 1
fi

# Check if already installed
INSTALLED=$(sdk list $CANDIDATE | grep "$TARGET_VERSION" | grep -i installed)

if [ -z "$INSTALLED" ]; then
    echo "🛠️ Installing Java $TARGET_VERSION..."
    sdk install $CANDIDATE $TARGET_VERSION
else
    echo "🔁 Java $TARGET_VERSION is already installed."
fi

# Step 4: Set as default if not already
CURRENT_DEFAULT=$(sdk current $CANDIDATE)

if [[ "$CURRENT_DEFAULT" != *"$TARGET_VERSION"* ]]; then
    echo "📌 Setting Java $TARGET_VERSION as default..."
    sdk default $CANDIDATE $TARGET_VERSION
else
    echo "📌 Java $TARGET_VERSION is already the default version."
fi

# Step 5: Update JAVA_HOME and PATH in ~/.bashrc (or ~/.zshrc if needed)
echo -e "\n⚙️ Updating environment variables (JAVA_HOME, PATH)..."

# Remove any previous SDKMAN-related exports to avoid duplication
sed -i '/^# SDKMAN Java settings$/d' ~/.bashrc
sed -i '/^export JAVA_HOME=/d' ~/.bashrc
sed -i '/^export PATH=.*sdk/d' ~/.bashrc

# Append updated environment settings
cat <<EOF >> ~/.bashrc

# SDKMAN Java settings
export JAVA_HOME="\$(sdk home java current)"
export PATH="\$JAVA_HOME/bin:\$PATH"
EOF

# Apply changes immediately
source ~/.bashrc

# Step 6: Final status output
echo -e "\n✅ All installed Java versions:"
sdk list java | grep "installed"

echo -e "\n✅ Currently active Java version:"
sdk default java  ${TARGET_VERSION}
sdk current