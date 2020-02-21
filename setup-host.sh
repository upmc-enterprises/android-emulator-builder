#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/host/install-android-command-line-tools.sh"
source "$currentDir/host/install-java.sh"
source "$currentDir/host/create-paths.sh"
source "$currentDir/host/install-paths.sh"
source "$currentDir/host/install-android-sdk.sh"
