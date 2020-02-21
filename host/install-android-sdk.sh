#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Prerequisites
mkdir -p "$HOME/.android"
touch "$HOME/.android/repositories.cfg"

# Install the SDKs
yes | sdkmanager --update
sdkmanager "platform-tools" "platforms;android-$androidSdkVersion" >> /dev/null
echo "Installed SDKs"
yes 2>/dev/null | sdkmanager --licenses || { status=$?; echo "Done"; }
