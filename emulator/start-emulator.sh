#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Start the emulator
$installDestination/emulator/emulator -avd "$emulatorDeviceName" -no-audio -wipe-data &

# Wait for the boot to finish
# Thanks: https://gist.github.com/mrk-han/db70c7ce2dfdc8ac3e8ae4bec823ba51

BOOT_ANIMATION=""
FAIL_COUNTER=0
SECONDS_UNTIL_TIMEOUT=60

until [[ "$BOOT_ANIMATION" =~ "stopped" ]]; do
    BOOT_ANIMATION=$(adb -e shell getprop init.svc.bootanim 2>&1 &) # Checks state of emulator while in the boot animation

    if [[ "$BOOT_ANIMATION" =~ "device not found" || "$BOOT_ANIMATION" =~ "device offline" || "$BOOT_ANIMATION" =~ "running" ]]; then
        ((FAIL_COUNTER += 1))
        echo "Waiting for emulator to start.. $FAIL_COUNTER"
        echo "Boot Animation State: $BOOT_ANIMATION"
        if [[ ${FAIL_COUNTER} -gt ${SECONDS_UNTIL_TIMEOUT} ]]; then
        echo "Timeout of $SECONDS_UNTIL_TIMEOUT seconds reached; failed to start emulator"
        exit 1
        fi
    fi

    sleep 1
done

echo "Emulator is ready!"
