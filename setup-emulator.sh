#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/config.sh"

alreadyHasAvd=$(emulator -list-avds | grep -o "$emulatorDeviceName")

# Don't bother setting up the AVD again, if already done
if [[ "$alreadyHasAvd" == "" ]]; then
  source "$currentDir/emulator/create-avd.sh"
fi

source "$currentDir/emulator/start-emulator.sh"
source "$currentDir/emulator/fix-gboard.sh"
source "$currentDir/emulator/fix-google-chrome.sh"
source "$currentDir/emulator/fix-google-maps.sh"
source "$currentDir/emulator/fix-webview-shell.sh"
