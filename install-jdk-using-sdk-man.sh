# ANSI color codes for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Starting JDK 21 setup with SDKMAN...${NC}"

# 1. Install SDKMAN if not already installed
if [ ! -d "$HOME/.sdkman" ]; then
  echo -e "${GREEN}📦 Installing SDKMAN!${NC}"
  curl -s "https://get.sdkman.io " | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
else
  echo -e "${GREEN}✅ SDKMAN is already installed.${NC}"
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Set non-interactive mode
export SDKMAN_AUTO_ANSWER=true

# 2. Install Java 21 using SDKMAN
echo -e "${GREEN}📥 Installing OpenJDK 21 via SDKMAN...${NC}"
sdk install java 21.0.6-tem

# 3. Set Java 21 as default (no prompt)
echo -e "${GREEN}⚡ Setting Java 21 as default...${NC}"
yes | sdk default java 21.0.6-tem

# 4. Get current Java home path
JAVA_HOME_PATH=$(sdk home java 21.0.6-tem)

# 5. Print result
echo -e "${GREEN}✅ JDK 21 is now active at:${NC}"
echo "$JAVA_HOME_PATH"

# 6. Verify installation
echo -e "\n${GREEN}🔍 Verifying Java version:${NC}"
java -version

# 7. Install direnv
echo -e "${GREEN}📥 Installing OpenJDK 21 via SDKMAN...${NC}"
sudo apt install direnv