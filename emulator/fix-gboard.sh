#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Fixing GBoard"
echo "==========================="
echo 


# Check to see if the emulator already has the Soft Keyboard
hasSoftKeyboard=$(adb shell 'pm list packages' | grep -o 'com\.example\.android\.softkeyboard')

# Install it, if it is missing
if [[ "$hasSoftKeyboard" == "" ]]; then
  echo "Device does not have the Soft Keyboard, installing..."
  adb install -t  "$currentDir/../bin/softkeyboard-debug.apk"
  echo "Install finished"

  sleep 5 # Give device time to settle
else
  echo "Device already has the Soft Keyboard, skipping install"
fi

# Switch to the new keyboard
adb shell 'ime set com.example.android.softkeyboard/.SoftKeyboard'
echo "Switched to the Soft Keyboard"
