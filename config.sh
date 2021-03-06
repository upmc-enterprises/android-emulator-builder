#!/bin/bash

##############################################
# Configuration to personalize your emulator #
##############################################

# Android SDK API level. See full list of API levels here:
# https://source.android.com/setup/start/build-numbers
androidSdkVersion="29"

# Sets up the screen resolution, RAM, and other device options
# to closely match the behavior, specifications, and performance
# of a real-world physical device.
#
# May be helpful to check the available profile names on a
# machine which has the avdmanager in advance to see the full
# list of supported profiles.
#
# To see the supported profiles, type: avdmanager list device
#
# Use the "ID" as the deviceProfile, below. For example, for
# the original Pixel XL, you will see this as an entry when
# running the above command:
#
# id: 19 or "pixel_xl"
#    Name: Pixel XL
#    OEM : Google
#
# Just use the ID, "pixel_xl", in this case.
deviceProfile="pixel_xl"

# Name of the AVD, can be anything you desire. Just remember it
# for later when you need to start it up for testing.
emulatorDeviceName="Device"

# Configures the host platform. Valid values are either "mac"
# or "linux".
#hostType="linux"
hostType="mac"

# Whether or not to include the Google Play store when setting
# up the emulator. All x86 images down to API 24 and x86_64
# images down to API 28 can support the Google Play Store.
# Please note that this framework assumes you are building x86
# emulators. See more information by runing: sdkmanager --list
includePlayStore=false

# Location to install the Android Command Line tools, and all
# requested SDKs. Also sets $ANDROID_HOME.
installDestination="$HOME/android"

############################################################################################

##########################################
# Internal configuration, for the hacker #
##########################################

# Regex used to locate the Android Command Line Tools on the
# Android Studio download page.
commandLineToolsDownloadUrlPattern=""

if [[ "$hostType" == "mac" ]]; then 
  commandLineToolsDownloadUrlPattern="https:\/\/dl.google.com\/android\/repository\/commandlinetools\-mac\-[0-9]*_latest\.zip"
else
  commandLineToolsDownloadUrlPattern="https:\/\/dl.google.com\/android\/repository\/commandlinetools\-linux\-[0-9]*_latest\.zip"
fi

# After the emulator indicates that it has booted, it may take a
# bit more time before the launcher shows and the device is ready
# for interaction. This number configures how many seconds to wait
# after the device indicates that it is ready before proceeding to
# interact with it.
emulatorBootedSleepTime=30

# Regex used to locate the latest version of JDK 8 available
# from SDKMan. More info on versions here: https://bit.ly/2SCGEnb
jdkPattern="8\.0\.[0-9][0-9][0-9]\.hs\-adpt"

# How long to wait, in seconds, before timing out and assuming
# that the emulator will not start. Adjust based on your 
# experiments/requirements.
startEmulatorTimeout=300
