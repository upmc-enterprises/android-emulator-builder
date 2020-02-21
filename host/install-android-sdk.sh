#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Prerequisites
mkdir -p "$HOME/.android"
touch "$HOME/.android/repositories.cfg"

# Install the SDKs
(while sleep 1; do echo y; done) | sdkmanager "platform-tools" "platforms;android-$androidSdkVersion" > /dev/null || { status=$?; echo "Done"; }
(while sleep 1; do echo y; done) | sdkmanager --licenses > /dev/null || { status=$?; echo "Done"; }
