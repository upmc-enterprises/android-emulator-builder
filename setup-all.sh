#!/bin/bash

currentDirController="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDirController/setup-host.sh"
source "$currentDirController/setup-emulator.sh"

echo 
echo "*******************************************************"
echo "**************** You are ready to go! *****************"
echo "*******************************************************"
echo 
