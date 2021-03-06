#!/bin/bash

currentDirController="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDirController/config.sh"
source "$installDestination/paths.sh"

# Don't bother setting up the AVD again, if already done
if [ -x "$(command -v $installDestination/emulator/emulator)" ]; then
  alreadyHasAvd=$($installDestination/emulator/emulator -list-avds | grep -o "$emulatorDeviceName")

  if [[ "$alreadyHasAvd" == "" ]]; then
    source "$currentDirController/emulator/create-avd.sh"
  fi
else
  source "$currentDirController/emulator/create-avd.sh"
fi

source "$currentDirController/emulator/start-emulator.sh"
source "$currentDirController/emulator/fix-gboard.sh"
source "$currentDirController/emulator/fix-google-chrome.sh"
source "$currentDirController/emulator/fix-google-maps.sh"
source "$currentDirController/emulator/fix-webview-shell.sh"

echo 
echo "*******************************************************"
echo "******** Finished setting up Android emulator! ********"
echo "*******************************************************"
echo 
