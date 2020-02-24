#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Install Android Command Line Tools"
echo "==========================="
echo 

# Download and extract the contents
toolsDownloadUrl=$(curl https://developer.android.com/studio | grep -o "$commandLineToolsDownloadUrlPattern")
echo "Downloading ZIP package"
curl -o android.zip $toolsDownloadUrl
echo "Download complete"
echo "Extacting ZIP package"
unzip -q android.zip -d ./android-unzip-temp
echo "Extraction complete"

mkdir -p $installDestination
mv ./android-unzip-temp/* $installDestination
rm -rf ./android-unzip-temp
rm android.zip

echo "Moved contents to $installDestination"
