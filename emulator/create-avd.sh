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
    imageName="system-images;android-$androidSdkVersion;google_apis_playstore;$hostArchitecture"
else
    echo "Not including the Google Play Store in the AVD"
    imageName="system-images;android-$androidSdkVersion;google_apis;$hostArchitecture"
fi

(for run in {1..1000}; do echo y; done) >> yep.txt

echo "Obtaining image: $imageName"
cat ./yep.txt | sdkmanager $imageName >> /dev/null
echo "Obtained"

echo "Accepting any remaining licenses"
cat ./yep.txt | sdkmanager --licenses
echo "All licenses accepted"

rm ./yep.txt

# Create the AVD
echo "Creating AVD: $emulatorDeviceName"

avdmanager create avd \
  --abi "google_apis/$hostArchitecture" \
  --device "$deviceProfile" \
  --force \
  --name "$emulatorDeviceName" \
  --package $imageName

echo "AVD created"
