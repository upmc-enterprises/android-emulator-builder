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
echo "SDKManager license"
(for run in {1..5}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager --update
echo "License accepted"

echo "Obtaining the platform tools and API $androidSdkVersion tools"
(for run in {1..30}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager "platform-tools" "platforms;android-$androidSdkVersion" >> /dev/null
echo "Finished obtaining tools"

echo "Accepting any remaining licenses"
(for run in {1..30}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager --licenses || { status=$?; echo "Done"; }
echo "All licenses accepted"
