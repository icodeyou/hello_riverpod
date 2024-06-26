#usage : ./upgrade_version.sh "Tag message"

if [[ $1 == '' ]]
then
	echo "Please provide a message in arguments."
	exit 0
fi

# get actual version
currentVersion=`grep 'version: ' brick.yaml | sed 's/version: //'`

# ask new version
echo "Your current version is $currentVersion"
echo "What is the name of your new version ?"
read newVersion

# Find and increment the version number.
sed -i '' "s/version: $currentVersion/version: $newVersion/" brick.yaml

# Commit and tag this change.
echo ""
echo "Commit message : RELEASE : $1 - Bump version to $newVersion"
git commit -m "RELEASE : $1 - Bump version to $newVersion" brick.yaml
echo ""
echo "Tag message:"
echo "Feature : $1"
git tag $newVersion -m "Feature : $1"

# Push ?
echo ""
echo "Here are the changes from the last commit :"
git --no-pager diff HEAD~
echo ""
echo "⏳ Publishing those changes on Mason :"
mason publish
git push
git push --tags origin
echo ""
echo "✅  Finished"