#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

# Download and extract the contents
toolsDownloadUrl=$(curl https://developer.android.com/studio | grep -o "$commandLineToolsDownloadUrlPattern")
curl -o android.zip $toolsDownloadUrl
unzip -q android.zip -d ./android-unzip-temp

mkdir -p $installDestination
mv ./android-unzip-temp/* $installDestination
rm -rf ./android-unzip-temp
rm android.zip
