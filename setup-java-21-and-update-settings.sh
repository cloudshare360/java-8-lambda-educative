#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}🚀 Starting setup: Installing Java 21.0.6-tem and updating VS Code settings...${NC}"

# 1. Install SDKMAN if not already installed
if [ ! -d "$HOME/.sdkman" ]; then
  echo -e "${GREEN}📦 Installing SDKMAN!${NC}"
  curl -s "https://get.sdkman.io " | bash
fi

# Load SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
source "$SDKMAN_DIR/bin/sdkman-init.sh"

# 2. Install Java 21.0.6-tem via SDKMAN
echo -e "${GREEN}📥 Installing Java 21.0.6-tem...${NC}"
sdk install java 11.0.27.fx-zulu
sdk install java 21.0.6-tem

# 3. Set Java 21.0.6-tem as default
echo -e "${GREEN}⚡ Setting Java 21.0.6-tem as default...${NC}"
sdk default java 21.0.6-tem

# 4. Get current Java home path dynamically
JAVA_HOME_PATH=$(sdk home java 21.0.6-tem)
echo -e "${GREEN}✅ Detected Java home path:${NC}"
echo "$JAVA_HOME_PATH"

# 5. Define VS Code settings file location
SETTINGS_JSON="$HOME/.vscode-server/data/Machine/settings.json"
mkdir -p "$(dirname "$SETTINGS_JSON")"

# 6. Build the JSON configuration for runtimes
RUNTIME_CONFIG=$(cat <<EOF
{
  "java.jdt.ls.java.home": "$JAVA_HOME_PATH",
  "java.configuration.runtimes": [
    {
      "name": "JavaSE-21",
      "path": "$JAVA_HOME_PATH",
      "default": true
    }
  ],
  "java.import.gradle.java.home": "$JAVA_HOME_PATH"
}
EOF
)

# 7. Install jq if not present
if ! command -v jq &> /dev/null; then
  echo -e "${GREEN}🔍 Installing jq for safe JSON handling...${NC}"
  sudo apt update && sudo apt install -y jq
fi

# 8. If settings.json exists, merge new config safely. Else create new.
if [ -f "$SETTINGS_JSON" ]; then
  echo -e "${GREEN}⚙️ Merging with existing settings.json...${NC}"
  echo "$RUNTIME_CONFIG" | jq -s '.[0] * .[1]' "$SETTINGS_JSON" - > "${SETTINGS_JSON}.tmp" && mv "${SETTINGS_JSON}.tmp" "$SETTINGS_JSON"
else
  echo -e "${GREEN}📁 Creating new settings.json...${NC}"
  echo "$RUNTIME_CONFIG" > "$SETTINGS_JSON"
fi

# 9. Verify
echo -e "${GREEN}📄 Updated settings.json at:${NC}"
echo "$SETTINGS_JSON"
cat "$SETTINGS_JSON"

echo -e "${GREEN}✅ Setup complete! Java 21.0.6-tem is active and configured in VS Code settings.${NC}"