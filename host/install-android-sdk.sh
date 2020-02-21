#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Prerequisites
mkdir -p "$HOME/.android"
touch "$HOME/.android/repositories.cfg"

# Install the SDKs
yes | sdkmanager --update && true
sdkmanager "platform-tools" "platforms;android-$androidSdkVersion"
echo "Installed SDKs"
yes | sdkmanager --licenses && true
