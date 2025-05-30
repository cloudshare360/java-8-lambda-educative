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

# Step 3: Capture all Temurin (tem) Java versions
echo -e "\n🔍 Fetching list of available Temurin Java versions..."
sdk list java > java-tem-list.txt

# Filter out only Temurin lines and remove headers/footers
grep 'tem' java-tem-list.txt | grep -v 'Version\|Omit\|================================================================================' > java-tem-filtered.txt

# Check if any Temurin versions were found
if [ ! -s java-tem-filtered.txt ]; then
    echo "❌ No Temurin Java versions found in SDKMAN."
    exit 1
fi

echo -e "\n📄 Available Temurin Java versions:"
cat java-tem-filtered.txt

# Step 4: Extract major version and identifier
# Format: <Vendor> | Use | Version | Dist | Status | Identifier
# We want to sort by Version, get latest, and use its Identifier
awk '{print $3 " " $6}' java-tem-filtered.txt | sort -V | tail -n1 | read -r LATEST_MAJOR LATEST_IDENTIFIER

if [ -z "$LATEST_IDENTIFIER" ]; then
    echo "❌ Failed to extract a valid Java version from the list."
    exit 1
fi

echo -e "\n🆕 Detected latest Temurin version: $LATEST_IDENTIFIER (based on major version $LATEST_MAJOR)"

# Step 5: Check if this version is already installed
INSTALLED=$(sdk list java | grep "$LATEST_IDENTIFIER" | grep -i installed)

if [ -z "$INSTALLED" ]; then
    echo "🛠️ Installing Java $LATEST_IDENTIFIER..."
    sdk install java "$LATEST_IDENTIFIER"
else
    echo "🔁 Java $LATEST_IDENTIFIER is already installed."
fi

# Step 6: Set as default if not already set
CURRENT_DEFAULT=$(sdk current java)

if [[ "$CURRENT_DEFAULT" != *"$LATEST_IDENTIFIER"* ]]; then
    echo "📌 Setting Java $LATEST_IDENTIFIER as default..."
    sdk default java "$LATEST_IDENTIFIER"
else
    echo "📌 Java $LATEST_IDENTIFIER is already the default version."
fi

# Step 7: Update JAVA_HOME and PATH in shell config (~/.bashrc)
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

# Step 8: Final status output
echo -e "\n✅ All installed Java versions:"
sdk list java | grep "installed"

echo -e "\n✅ Currently active Java version:"
sdk current java