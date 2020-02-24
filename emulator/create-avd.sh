#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Creating the AVD"
echo "==========================="
echo 

# Obtain the AVD image
imageName=""

if ( $includePlayStore ); then
    echo "Including the Google Play Store in the AVD"
    imageName="system-images;android-$androidSdkVersion;google_apis_playstore;x86"
else
    echo "Not including the Google Play Store in the AVD"
    imageName="system-images;android-$androidSdkVersion;google_apis;x86"
fi

echo "Obtaining image: $imageName"
(for run in {1..30}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager $imageName >> /dev/null
echo "Created!"

echo "Accepting any remaining licenses"
(for run in {1..30}; do sleep 3; echo y 2>/dev/null; done) | sdkmanager --licenses

# Create the AVD
echo "Creating AVD: $emulatorDeviceName"

avdmanager create avd \
  --abi google_apis/x86 \
  --device $deviceProfile \
  --force \
  --name $emulatorDeviceName \
  --package $imageName

echo "AVD create"
