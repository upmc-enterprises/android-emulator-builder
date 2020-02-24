#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Fixing Google Maps"
echo "==========================="
echo 


# Open Google Maps and dismiss the on-boarding prompt
echo "Opening Google Maps"
adb shell 'monkey -p com.google.android.apps.maps -c android.intent.category.LAUNCHER 1'
sleep 5

echo "Dismissing the On-Boarding prompt"
adb shell 'input keyevent 4' # 4 == System back button
sleep 5

echo "Closing Google Maps"
adb shell 'am force-stop com.google.android.apps.maps'
sleep 5
echo "Done"
