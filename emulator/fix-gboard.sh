#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Check to see if the emulator already has the Soft Keyboard
hasSoftKeyboard=$(adb shell 'pm list packages' | grep -o 'com\.example\.android\.softkeyboard')

# Install it, if it is missing
if [[ "$hasSoftKeyboard" == "" ]]; then
  adb install -t app-debug.apk
fi

# Switch to the new keyboard
adb shell 'ime set com.example.android.softkeyboard/.SoftKeyboard'
