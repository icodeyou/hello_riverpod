# FlutterApp

FlutterApp has been built with Mason, using the brick hello_riverpod.

## Prerequisites
FlutterApp runs on following devices :
- Android >= API 21
- iOS >= iOS 10.12

# Getting started
## Running the project

### Run from Terminal
To compile the project, run the following command :
```
flutter run
```

If you need to specify the device, run the last command with the argument :
`-d {DEVICE_ID}`

If this is the first time you run the project, or if you edited some files annotated with @freezed,
you might want to run this command before :
`flutter pub run build_runner build --delete-conflicting-outputs`

## Deliveries
### Android
Run the command : `flutter build apk`

### iOS
Make sure to prepare your files `ExportOptions.plist` in the iOS folder.

Then, run the following command :

`flutter build ipa --export-options-plist=ios/ExportOptions.plist`

# Architecture
## State Management : Riverpod
We chose [Riverpod](https://riverpod.dev/) as a solution for State Management.

Here is a diagram that shows how providers and states are organized in the project :

<img src="assets/readme/architecture_riverpod.png" width="400">
