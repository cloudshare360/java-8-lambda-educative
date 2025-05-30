#!/bin/bash

# Load SDKMAN! if available
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Then run your commands
sdk list java | grep "installed"
echo y |sdk install java 21.0.6.fx-zulu
sdk use java 21.0.6.fx-zulu
sdk default java 21.0.6.fx-zulu
sdk current
sdk list java | grep "installed"