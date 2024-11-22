# Prepare the project from zero
.PHONY: prepare
prepare: build loc

.PHONY: build
build:
	dart pub run build_runner build --delete-conflicting-outputs

.PHONY: loc
loc:
	dart run slang

.PHONY: generateIcons
generateIcons:
	echo "Place a file icon.jpg in the root of the project"
	read -p "Press enter to continue"
	dart run flutter_launcher_icons

