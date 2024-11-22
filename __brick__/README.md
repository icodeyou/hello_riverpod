# {{projectName}}

{{projectName}} has been built with Mason, using the brick hello_riverpod.

## Getting started

### Running the project

To compile the project, run the following command :

```shell
flutter run
```

If you need to specify the device, add the argument :
`-d {DEVICE_ID}`

💡 Replace {DEVICE_ID} by the ID of your target device. You can find it by running the command `flutter devices`

If this is the first time you run the project, or if you edited some files annotated with @freezed, you might want to run this command before running the project :
`make prepare`

### Deliveries

#### Android

Run the command : `flutter build apk`

#### iOS

Make sure to prepare your files `ExportOptions.plist` in the iOS folder.

Then, run the following command :

`flutter build ipa --export-options-plist=ios/ExportOptions.plist`

## Git Workflow

### Branch tree

Syntax for the name of branches : kebab-case

Here is the tree of branches :

- master
  - develop

### Commits and tags

For more details concerning commits and tags, please refer to [GIT_CONVENTIONS.md](https://github.com/hello_riverpod/blob/main/GIT_CONVENTIONS.md)

## Technical stack

### Flutter

The app is developed in Flutter. More info on [flutter.dev](https://flutter.dev)
The app can run on [several platforms](https://docs.flutter.dev/reference/supported-platforms).

#### Flutter Channels

We must use as much as possible the channel "stable" for production deliveries.
We can switch to "beta" to use a recent feature, or to fix a problem not released on "stable"
However, we should never use "master" or "dev" channels.

More information here : [Flutter channels](https://docs.flutter.dev/release/upgrade#switching-flutter-channels)

### Architecture

This project uses Riverpod for state management and Clean Architecture.
Here is the [Riverpod documentation](https://riverpod.dev/).
