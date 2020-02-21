#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Open Google Maps and dismiss the on-boarding prompt
adb shell 'monkey -p com.google.android.apps.maps -c android.intent.category.LAUNCHER 1'
adb shell 'input keyevent 4' # 4 == System back button
adb shell 'am force-stop com.google.android.apps.maps'
