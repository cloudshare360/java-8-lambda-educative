#!/bin/bash

set -e

echo "🔍 Checking installed Java versions..."
update-java-alternatives --list 2>/dev/null || echo "No full JDKs found."

# Helper function to check and install Java version
install_java_if_missing() {
    local version=$1
    if ! java_version=$(update-java-alternatives --list | grep -q "java-$version" 2>/dev/null); then
        echo "📥 Installing Java $version..."
        sudo apt-get update -y > /dev/null
        sudo apt-get install -y openjdk-$version-jdk > /dev/null
        echo "✅ Java $version installed."
    else
        echo "✅ Java $version already installed."
    fi
}

# Install required Java versions
install_java_if_missing 11
install_java_if_missing 17
install_java_if_missing 21

# Set Java 21 as default
echo "⚙️ Setting Java 21 as default..."
sudo update-alternatives --set java $(update-java-alternatives --list | grep java-21 | head -n1 | awk '{print $3}/bin/java')
sudo update-alternatives --set javac $(update-java-alternatives --list | grep java-21 | head -n1 | awk '{print $3}/bin/javac')

# Verify
echo "✅ Final default Java version:"
java -version