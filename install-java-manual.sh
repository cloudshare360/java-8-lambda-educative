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
java -version
java -version
echo $JAVA_HOME