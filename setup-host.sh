#!/bin/bash

currentDirController="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDirController/host/install-android-command-line-tools.sh"
source "$currentDirController/host/install-java.sh"
source "$currentDirController/host/create-paths.sh"
source "$currentDirController/host/install-paths.sh"
source "$currentDirController/host/install-android-sdk.sh"
