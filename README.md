# flutterpi_tool
A tool to make developing &amp; distributing flutter apps for https://github.com/ardera/flutter-pi easier.

> **Telosnex fork:** branch `telosnex/flutter-3.50` supports the exact Flutter
> 3.50 toolchain used by Telosnex. Consumers should pin a full commit; this fork
> is not published to pub.dev.

## 📰 News
- Building & Running apps on [meta-flutter](https://github.com/meta-flutter/meta-flutter) yocto distros works now,
  via the `--fs-layout=meta-flutter` option to `flutterpi_tool devices add`, `flutterpi_tool build`.
- RISC-V 64-bit is now supported as a target & host platform.
- The flutter-pi binary to bundle can now be explicitly specified using
  `--flutterpi-binary=...`

## Setup
In this checkout, use `dart` from the selected Flutter 3.50 SDK:

```shell
dart tool/link_sdk.dart
dart pub get --enforce-lockfile
```

To invoke the tool from a Flutter app directory, use its locked package config:

```shell
dart --packages=/path/to/flutterpi_tool/.dart_tool/package_config.json \
  /path/to/flutterpi_tool/bin/flutterpi_tool.dart --help
```

The examples below use `flutterpi_tool` as shorthand for this invocation.

## Usage
```console
$ flutterpi_tool --help
A tool to make development & distribution of flutter-pi apps easier.

Usage: flutterpi_tool <command> [arguments]

Global options:
-h, --help         Print this usage information.
-d, --device-id    Target device id or name (prefixes allowed).

Other options
    --verbose      Enable verbose logging.

Available commands:

Flutter-Pi Tool
  precache   Populate the flutterpi_tool's cache of binary artifacts.

Project
  build      Builds a flutter-pi asset bundle.
  run        Run your Flutter app on an attached device.

Tools & Devices
  devices    List & manage flutterpi_tool devices.

Run "flutterpi_tool help <command>" for more information about a command.
```

## Examples
### 1. Adding a device
```console
$ flutterpi_tool devices add pi@pi5
Device "pi5" has been added successfully.
```

### 2. Adding a device with an explicit display size of 285x190mm, and a custom device name
```console
$ flutterpi_tool devices add pi@pi5 --display-size=285x190 --id=my-pi
Device "my-pi" has been added successfully.
```

### 3. Adding a device that uses [meta-flutter](https://github.com/meta-flutter/meta-flutter)
```console
$ flutterpi_tool devices add root@my-yocto-device --fs-layout=meta-flutter
```

### 4. Listing devices
```console
$ flutterpi_tool devices
Found 1 wirelessly connected device:
  pi5 (mobile) • pi5 • linux-arm64 • Linux

If you expected another device to be detected, try increasing the time to wait
for connected devices by using the "flutterpi_tool devices list" command with
the "--device-timeout" flag.
...
```

### 5. Creating and running an app on a remote device
```console
$ flutter create hello_world && cd hello_world

$ flutterpi_tool run -d pi5
Launching lib/main.dart on pi5 in debug mode...
Building Flutter-Pi bundle...
Installing app on device...
...
```

### 6. Running the same app in profile mode
```
$ flutterpi_tool run -d pi5 --profile
```
