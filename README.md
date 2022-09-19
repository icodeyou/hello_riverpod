# hello_riverpod

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A complete starter project for Flutter apps, with examples of navigation, requests and tests. The app uses `riverpod`, `go_router`, (`hive`), `mockito`, and follows the guidelines of Clean Architecture.

## Prerequisites

Installed version of [Mason](https://pub.dev/packages/mason)

## Get Started

To create a new project using hello_provider, run the following commands :
```
flutter create my_app
mkdir mason
cd mason
mason init
mason add hello_provider
mason make hello_provider --on-conflict overwrite -o ../
flutter pub add flutter_riverpod go_router freezed freezed_annotation build_runner http mocktail intl test
flutter pub add json_serializable --dev
flutter pub get
```

## Output
```
├── xxxxxxx
│   └── xxxxxx.dart
├── xxxxxxx
│   └── xxxxxxxx.dart
├── xxxxxxxxx
│   ├── xxxxxxxxxxxx.dart
│   └── x.dart
└── xxxxxxxxxx
    └── xxxxxxxxxx.dart
```