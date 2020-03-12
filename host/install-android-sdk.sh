#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Install Android Command Line Tools"
echo "==========================="
echo 

# Prerequisites
mkdir -p "$HOME/.android"
touch "$HOME/.android/repositories.cfg"

# Install the SDKs
(for run in {1..1000}; do echo y; done) >> yep.txt

echo "SDKManager license"
cat ./yep.txt | sdkmanager --update
echo "License accepted"

echo "Obtaining the platform tools and API $androidSdkVersion tools"
cat ./yep.txt | sdkmanager "platform-tools" "platforms;android-$androidSdkVersion" >> /dev/null
echo "Finished obtaining tools"

echo "Accepting any remaining licenses"
cat ./yep.txt | sdkmanager --licenses
echo "All licenses accepted"

rm ./yep.txt
