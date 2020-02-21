#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Prerequisites
mkdir -p "$HOME/.android"
touch "$HOME/.android/repositories.cfg"

# Install the SDKs
(for run in {1..5}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager --update
(for run in {1..5}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager "platform-tools" "platforms;android-$androidSdkVersion"
(for run in {1..30}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager --licenses || { status=$?; echo "Done"; }
