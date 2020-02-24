#!/bin/bash

currentDirController="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDirController/config.sh"
source "$installDestination/paths.sh"

less "$installDestination/paths.sh"
which emulator

alreadyHasAvd=$(emulator -list-avds | grep -o "$emulatorDeviceName")

# Don't bother setting up the AVD again, if already done
if [[ "$alreadyHasAvd" == "" ]]; then
  source "$currentDirController/emulator/create-avd.sh"
fi

source "$currentDirController/emulator/start-emulator.sh"
source "$currentDirController/emulator/fix-gboard.sh"
source "$currentDirController/emulator/fix-google-chrome.sh"
source "$currentDirController/emulator/fix-google-maps.sh"
source "$currentDirController/emulator/fix-webview-shell.sh"
