#!/bin/bash

##############################################
# Configuration to personalize your emulator #
##############################################

##############################################
# For Android Phone and Tablet emulators only
#
# Not for Android TV (Google TV)
# Not for Android Wear (Wear OS)
# Not for Android Automotive
# Not for Chrome OS
##############################################

# Android SDK API level. See full list of API levels here:
# https://source.android.com/setup/start/build-numbers
#
# Please note that pre-release versions use letters as the
# release name before it is generally avaiable. For example,
# Android 11 (API 30) was known as R before it was released.
# If you need a pre-release version, use the version letter
# here.
androidSdkVersion="30"

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
# The avdmanager is available inside of the Command Line tools
# ZIP package as provided at https://developer.android.com/studio
#
# Use the "ID" as the deviceProfile, below. For example, for
# the Google Pixel 4 XL, you will see this as an entry when
# running the above command:
#
# id: 23 or "pixel_4_xl"
#     Name: Pixel 4 XL
#     OEM : Google
#
# Just use the ID, "pixel_4_xl", in this case.
deviceProfile="pixel_4_xl"

# Name of the AVD, can be anything you desire. Just remember it
# for later when you need to start it up for testing.
emulatorDeviceName="Device"

# Configures the host platform. Valid values are either "mac"
# or "linux".
hostType="mac"

# Google ships different versions of their AVDs to support different
# host chipset architectures. For example, newer M1-based Macs require
# an ARM-based AVD to work properly, while Intel-based machines should
# use x86 or x86_64 images.
# 
# Please note that Google does not ship all combinations of their AVDs
# for all architectures. For instance, there isn't an ARM-based image
# available for API 30, but there is for API 31. If you need an idea of
# what Google has available for your architecture, run this command from
# your terminal: sdkmanager --list
#
# The sdkmanager is available inside of the Command Line tools
# ZIP package as provided at https://developer.android.com/studio
#
# As of 06/22/21, Google provides Android phone and tablet AVDs for 4
# architectures:
#  - x86 (API 10 - API 30)
#  - x86_64 (API 21+)
#  - arm64-v8a (Sparodic support since API 24)
#  - armeabi-v7a (API 10 - API 25)
#
# For M1-based Macs you need the arm64-v8a image.
# For Intel-based Macs and most Linux hardware, you need either the x86
# or the x86_64 image.
#
# Valid values are "x86", "x86_64", "arm64-v8a", or "armeabi-v7a".
hostArchitecture="arm64-v8a"

# Whether or not to include the Google Play store when setting
# up the emulator. As of 06/22/21, here is the support landscape for
# AVDs with Google Play installed:
#  - x86 (API 24+)
#  - x86_64 (API 28+)
#  - arm64-v8a (API 31+)
#  - armeabi-v7a (No support)
#
# For more information, run this command from your terminal:
# sdkmanager --list
#
# The sdkmanager is available inside of the Command Line tools
# ZIP package as provided at https://developer.android.com/studio
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
