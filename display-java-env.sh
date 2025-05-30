#!/bin/bash

# Define SDKMAN installation path
SDKMAN_DIR="$HOME/.sdkman"

# Step 1: Check if SDKMAN is installed, and install it if not
if [ ! -d "$SDKMAN_DIR" ]; then
    echo "SDKMAN not found. Installing SDKMAN..."
    
    # Download and install SDKMAN
    curl -s "https://get.sdkman.io"  | bash
    
    # Source SDKMAN after installation
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
else
    echo "SDKMAN already installed. Sourcing..."
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Step 2: Check installed Java versions
echo -e "\nInstalled Java versions:"
sdk list java | grep "installed"

# Step 3: Show currently active Java version
echo -e "\nCurrently active Java version:"
sdk current java