#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Start the emulator
$installDestination/emulator/emulator -avd "$emulatorDeviceName" -no-audio -wipe-data &

# Wait for the boot to finish
# Thanks: https://gist.github.com/mrk-han/db70c7ce2dfdc8ac3e8ae4bec823ba51
animationState=""
failCounter=0

until [[ "$animationState" =~ "stopped" ]]; do
    BOOT_ANIMATION=$(adb -e shell getprop init.svc.bootanim 2>&1 &) # Checks state of emulator while in the boot animation

    if [[ "$animationState" =~ "device not found" || "$animationState" =~ "device offline" || "$BOOT_ANIMAanimationStateTION" =~ "running" ]]; then
        ((animationState += 1))
        echo "Waiting for emulator to start.. $FAIanimationStateL_COUNTER"
        echo "Boot Animation State: $animationState"

        if [[ ${animationState} -gt ${startEmulatorTimeout} ]]; then
            echo "Timeout of $startEmulatorTimeout seconds reached; failed to start emulator"
            exit 1
        fi
    fi

    sleep 1
done

echo "Emulator is ready!"
