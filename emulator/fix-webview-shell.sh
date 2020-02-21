#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Check to see if the Webview Shell exists
hasWebViewShell=$(adb shell 'pm list packages' | grep -o 'org\.chromium\.webview_shell')

# Disable the package, if it is installed
if [[ "$hasWebViewShell" != "" ]]; then
  adb shell 'su 0 pm disable org.chromium.webview_shell'
fi
