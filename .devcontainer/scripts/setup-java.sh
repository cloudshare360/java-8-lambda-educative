#!/bin/bash

set -e

# Ensure sudo is available
if ! command -v sudo &> /dev/null; then
  echo "❌ sudo is required"
  exit 1
fi

# Install java-common if update-java-alternatives is missing
if ! command -v update-java-alternatives &> /dev/null; then
  echo "📎 Installing java-common to get update-java-alternatives..."
  sudo apt-get update -y > /dev/null
  sudo apt-get install -y java-common > /dev/null
  echo "✅ java-common installed"
fi

# Helper function to check and install Java version
install_java_if_missing() {
    local version=$1
    if ! java_home="/usr/lib/jvm/java-${version}-openjdk-amd64" && [ ! -d "$java_home" ]; then
        echo "📥 Installing Java $version..."
        sudo apt-get update -y > /dev/null
        sudo apt-get install -y openjdk-${version}-jdk > /dev/null
        echo "✅ Java $version installed."
    else
        echo "✅ Java $version already installed."
    fi
}

# Install required Java versions
install_java_if_missing 11
install_java_if_missing 17
install_java_if_missing 21

# Set Java 21 as default using update-java-alternatives
echo "⚙️ Setting Java 21 as default..."

JAVA_21_PATH="/usr/lib/jvm/java-21-openjdk-amd64"

# Register Java 21 with alternatives system if needed
for bin in java javac jar; do
  if [ -f "${JAVA_21_PATH}/bin/${bin}" ]; then
    echo "📎 Configuring ${bin} to use Java 21..."
    sudo update-alternatives --install /usr/bin/${bin} ${bin} ${JAVA_21_PATH}/bin/${bin} 2000
    sudo update-alternatives --set ${bin} ${JAVA_21_PATH}/bin/${bin}
  fi
done

# Verify
echo "✅ Final default Java version:"
java -version