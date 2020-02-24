#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Install JDK 8"
echo "==========================="
echo 

# Install SDKMan
echo "Installing SDKMan"
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
echo "Finished installing SDKMan"

# Install JDK
jdkVersion=$(sdk list java | grep -o "$jdkPattern")
echo "Installing JDK"
sdk install java $jdkVersion
echo "Finished istalling SDKMan"
