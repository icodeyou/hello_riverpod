# hello_riverpod - Snowball version

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A complete starter project for Flutter apps.

With hello_riverpod, you can easily create a new Flutter project that follows the guidelines of Clean Architecture, and with all the basic packages ready to use (`riverpod`, `go_router`, `freezed`, `intl`, `mocktail`).

## Prerequisites

Installed version of [Mason](https://pub.dev/packages/mason)

## Get Started

All you need to do is [this script](https://github.com/icodeyou/hello_riverpod/blob/master/gen.sh).
Download it and put it in a folder where you want to create your new projects.
Then, run it with `./gen.sh snowball` and follow the instructions.

Your projects will be added in a folder named `SNOWBALL/`

Feel free to create an issue if you have any question.

Cheers ✨

## Architecture

This project uses Riverpod for state management and Clean Architecture.

### Riverpod

We chose [Riverpod](https://riverpod.dev/) as a solution for State Management.

Here is a diagram that shows how providers and states are organized in the project :

![App Architecture Diagram](assets/readme/architecture_riverpod.png)

### Clean Architecture

We rely as much as possible on the Clean Architecture.
It is important to distinct the following layers in the code :

- Entities
- Database provider
- Repository
- Business logic
- UI
