rm -rf test_project/
cp -r ../__brick__/ test_project/
cp test_files/* test_project/
cd test_project/
flutter pub run
as .