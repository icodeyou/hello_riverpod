# hello_riverpod - Snowball version

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A complete starter project for Flutter apps. 
With hello_riverpod, you can easily create a new Flutter project that follows the guidelines of Clean Architecture, and with all the basic packages ready to use (`riverpod`, `go_router`, `freezed`, `intl`, `mocktail`).

⚠️ This Mason Project is only working if you create your project using `very_good create` (see the details below)

## Prerequisites

Installed version of [Mason](https://pub.dev/packages/mason)

Installed version of [Very Good CLI](https://github.com/VeryGoodOpenSource/very_good_cli)
✅ hello_riverpod tested with version 0.9.1

## Why are we using Very Good CLI ?
`Very Good Core` provides all the configuration we need for a new project with several flavors. This has become a standard for many developers, even for those using Riverpod. The problem is that 'very_good create' generates projects with an architecture based on BLoC.

Thanks to `hello_riverpod`, you now have a way to generate a 'Very Good project', and clean it in a way that makes it ready to use Riverpod instead of BLoC. 

## Get Started

To create a new project using hello_provider, run the following commands :
```
very_good create my_app
cd my_app
rm -rf lib/counter
rm -rf test/**

mkdir mason
cd mason
mason init
mason add hello_riverpod
mason make hello_riverpod --on-conflict overwrite -o ../

cd ..
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```
