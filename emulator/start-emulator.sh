#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Start the emulator and wait for the boot to finish
$installDestination/emulator/emulator -avd "$emulatorDeviceName" -no-audio -wipe-data &
adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done;'
