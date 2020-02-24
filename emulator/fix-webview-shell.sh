#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Fixing Webview Shell"
echo "==========================="
echo 

# Check to see if the Webview Shell exists
hasWebViewShell=$(adb shell 'pm list packages' | grep -o 'org\.chromium\.webview_shell')

# Disable the package, if it is installed
if [[ "$hasWebViewShell" != "" ]]; then
  echo "Disabling the Webview Shell"
  adb shell 'su 0 pm disable org.chromium.webview_shell'
else
  echo "Webview Shell is not present on this device, nothing to disable"
fi
