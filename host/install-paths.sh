#!/bin/bash

currentDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$currentDir/../config.sh"

echo
echo "==========================="
echo "Installing the paths.sh file"
echo "==========================="
echo 

mv "$currentDir/paths.sh" "$installDestination/paths.sh"
echo "Moved from $currentDir/paths.sh to $installDestination/paths.sh"
source "$installDestination/paths.sh"

# Install to the Bash shell
touch $HOME/.bash_profile
echo "" >> $HOME/.bash_profile
echo "# Android development environment modifications" >> $HOME/.bash_profile
echo "source $installDestination/path.sh" >> $HOME/.bash_profile
echo "Installed into the Bash shell"

# Install to Zsh
touch $HOME/.zshrc
echo "" >> $HOME/.zshrc
echo "# Android development environment modifications" >> $HOME/.zshrc
echo "source $installDestination/paths.sh" >> $HOME/.zshrc
echo "Installed into Zsh"
