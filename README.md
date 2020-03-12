<div align="center">
<h1>Android Emulator Builder<br/><sub>Go from zero to Android emulator, automatically</sub></h1>

```text
"Ideal for CI setup, automated testing, OS image creation, and other hands-off scenarios."
```

[![Build Emulator Status](https://github.com/upmc-enterprises/android-emulator-builder/workflows/Build%20Emulator/badge.svg)](https://github.com/upmc-enterprises/android-emulator-builder/actions) ![Platform Support](https://img.shields.io/badge/Platform-macOS%20%7C%20linux-green) ![Shell Support](https://img.shields.io/badge/Shell-bash%20%7C%20zsh-green) [![Latest Release](https://img.shields.io/github/v/release/upmc-enterprises/android-emulator-builder?label=Release)](https://github.com/upmc-enterprises/android-emulator-builder/releases)

<hr />
</div>

## Getting Started

Using this application is easy. To get started using it:

1. Edit the `config.sh` file to your liking
1. Run `./setup-all.sh` to set up the host and emulator
1. There is no step 3

## Understanding the Configuration

The `config.sh` file is the central point for configuring the behavior of the pipeline. Here is a table showing all of the properties you can change to adapt its behavior.

| Parameter | Description | Type | Basic Config |
|:------------------------------------:|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------:|:--------------------:|
| `androidSdkVersion` | Android SDK API level to apply to the emulator. See more at [https://source.android.com/setup/start/build-numbers](https://source.android.com/setup/start/build-numbers). | String | :white_check_mark: |
| `deviceProfile` | ID of the physical device whose hardware properties to emulate. See all supported devices by typing: `avdmanager list device`. Use the `ID`, not the `Name` when changing this value. | String | :white_check_mark: |
| `emulatorDeviceName` | Any name you would like to call your emulator. | String | :white_check_mark: |
| `hostType` | Either `mac` or `linux`. Helps the script adapt for minor differences when running on either platform. | String | :white_check_mark: |
| `includePlayStore` | Whether or not to include the Google Play store on the AVD. Works on API 24+ (x86) and API 28+ (x86_64). Please note that this framework assumes you are building on x86. See more information by typing: `sdkmanager --list`. | Boolean | :white_check_mark: |
| `installDestination` | Directory to which all of the Android SDKs and tools are downloaded. Also sets `$ANDROID_HOME`. | String | :white_check_mark: |
| `commandLineToolsDownloadUrlPattern` | Regex pattern used to extract the latest Command Line Tools from the Android Studio download page. | String | :x: |
| `emulatorBootedSleepTime` | How long to wait, in seconds, after the emulator's boot has finished to ensure the launcher is visible and ready for user interaction. | Integer | :x: |
| `jdkPattern` | Regex pattern used to identify the latest JDK 8 build available from SDKMan. | String | :x: |
| `startEmulatorTimeout` | How long to wait, in seconds, before assuming the Android Emulator will not or did not properly start. | Integer | :x: |

Feel free to open the `setup-emulator.sh` and `setup-host.sh` files to see each of the steps which run, and enable or disable them according to your needs.

## Host vs. Emulator

For the sake of clarity, this section defines the differences between a Host and an Emulator. You will see these terms sprinkled throughout the scripts and documentation.

- **Host:** Either a MacOS machine or a Linux machine. It is the bare metal on which the emulator itself runs, and the location to which all of the Android SDKs, the JDK, and Command Line Tools are installed.
- **Emulator:** The software which ships with the Android SDK which contains the virtual environment in which the Android OS runs.

<br>
<hr />
<br>
<br>

<div align="center">
<p>This project was inspired by a need for the <a href="https://myupmc.upmc.com" target="_blank">MyUPMC</a> project at <a href="https://enterprises.upmc.com" target="_blank">UPMC Enterprises</a></p>

<a href="https://myupmc.upmc.com" target="_blank">
    <img alt="MyUPMC" src=".docs/logos/myupmc.png" height="40" />
</a>

<a href="https://enterprises.upmc.com" target="_blank">
    <img alt="UPMC Enterprises" src=".docs/logos/upmc-enterprises.jpg" height="40" />
</a>
</div>
