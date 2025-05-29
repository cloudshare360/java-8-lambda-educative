curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk selfupdate force
sdk version
sdk env init
echo y |sdk install java 11.0.27-tem 
echo y |sdk install java 17.0.15-tem
echo y |sdk install java 21.0.6-tem 
sdk use java 21.0.6-tem 
sdk list java | grep "installed"
java -version