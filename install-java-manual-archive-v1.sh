eval "$(direnv hook bash)"
sudo apt-get update
sudo apt-get install -y direnv
echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
source ~/.bashrc
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk env init
sdk selfupdate force
sdk version
echo y |sdk install java 11.0.27-tem 
echo y |sdk install java 17.0.15-tem
echo y |sdk install java 21.0.6-tem 
sdk use java 21.0.6-tem 
sdk list java | grep "installed"
export JAVA_HOME="$JAVA_HOME_PATH"
export PATH="$JAVA_HOME/bin:$PATH"

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

java -version
java -version
echo $JAVA_HOME