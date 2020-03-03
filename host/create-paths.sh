#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Creating the paths.sh file"
echo "==========================="
echo 

# Create the file
echo "export ANDROID_HOME=$installDestination/cmdline-tools/latest/" >> "$currentDir/paths.sh"
echo -n 'PATH=$PATH:' >> "$currentDir/paths.sh"
echo "$installDestination/cmdline-tools/latest/bin/" >> "$currentDir/paths.sh"
echo -n 'PATH=$PATH:' >> "$currentDir/paths.sh"
echo "$installDestination/emulator/" >> "$currentDir/paths.sh"
echo -n 'PATH=$PATH:' >> "$currentDir/paths.sh"
echo "$installDestination/platform-tools/" >> "$currentDir/paths.sh"

echo "File created"
cat "$currentDir/paths.sh"

# Change the permissions
chmod 755 "$currentDir/paths.sh"
