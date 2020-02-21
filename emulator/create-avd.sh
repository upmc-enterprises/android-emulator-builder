#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Obtain the AVD image
imageName=""

if ( $includePlayStore ); then
    imageName="system-images;android-$androidSdkVersion;google_apis_playstore;x86"
else
    imageName="system-images;android-$androidSdkVersion;google_apis;x86"
fi

(for run in {1..30}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager $imageName
(for run in {1..30}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager --licenses

# Create the AVD
avdmanager create avd \
  --abi google_apis/x86 \
  --device $deviceProfile \
  --force \
  --name $emulatorDeviceName \
  --package $imageName
