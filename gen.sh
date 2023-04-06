SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH

echo "Prerequisites : Make sure that following CLI are installed :"
echo "flutter, very_good, mason, gh"
echo ""

echo "Enter the name of the project (ex: Top Gun) : "
read nameUppercase
nameUppercaseNoSpace=$(echo "$nameUppercase" | tr -d ' ')
nameLowercase=$(echo "$nameUppercase" | awk '{print tolower($0)}' | tr -d ' ')

# Check if HELLOWORLDS folder exists in this path
if ! [ -d "HELLOWORLDS" ]; then
  mkdir HELLOWORLDS
  else 
    # Check if project already exists in HELLOWORLDS/
    if [ -d "HELLOWORLDS/$nameLowercase" ]; then
      echo "$nameLowercase does exist in HELLOWORLDS/"
      echo "Delete the folder or choose another name for your project."
      echo ""
      exit
    fi
fi

org="com.$nameLowercase"
bundleId="$org.app"

echo "⚠️ Your organization is by default : $org"
echo "If this is OK, press enter. Otherwise type the name of your new org :"
read newOrg
if [[ $newOrg != '' ]]; then org="$newOrg"; fi

echo ""
echo "The Bundle ID will be : $org.app"
echo "If this is OK, press enter. Otherwise press Ctrl+C"
read

cd HELLOWORLDS/

( # try
	set -e
	echo ""
	echo ""
    echo "🔥 Creating project '$nameLowercase' with bundle ID '$org.app' 🔥"
    echo ""
    very_good create flutter_app $nameLowercase --org-name $org --application-id $bundleId
    cd $nameLowercase #Navigating to new project
    echo ""
    echo "ℹ️ Cleaning very good project"
    rm -f pubspec.lock
    rm -rf lib/counter
    rm -rf lib/app/app.dart
    rm -rf test/**
    echo ""
    echo "⚠️ Removing folders web/ linux/ windows/ macos/"
    rm -rf web/ linux/ windows/ macos/ #this can be removed when very_good has a flag like "--platforms"
    # https://github.com/VeryGoodOpenSource/very_good_cli/issues/467 OMG felangel just answered !
)

#catch error
errorCode=$?
if [ $errorCode -ne 0 ]; then
  echo ""
  echo "We have an error !"
  echo "⚠️ This folder is about to be deleted : $PWD/$nameLowercase"
  echo "Do you want to delete it ? Press enter to confirm, type NO if you want to keep it :"
  read answer
  if [[ $answer != 'NO' ]]; then rm -rf $nameLowercase; echo "Removed generated project $folderToDelete"; fi
  exit $errorCode
fi 

# Git upload
cd $nameLowercase #Navigating to new project
projectPath=$PWD
echo ""
echo ""
echo "🔥 Creating Git Repository for project $nameLowercase 🔥"
git init
git add --all
git commit -m "First commit 🦋"

echo "Do you want to push the repo to Github ? Press enter to confirm, type NO otherwise :"
read githubAnswer
if [[ $githubAnswer != 'NO' ]]; then 
  gh repo create $nameLowercase --private
  git remote add origin https://github.com/icodeyou/$nameLowercase.git
  echo "New remote URLs :"
  git remote -v
  git push -u origin master

  echo ""
  echo "If you have this message : 'command not found: gh' ➡️ Follow steps below :"
  echo "1) Run 'brew install gh'"
  echo "2) Run 'gh repo create $nameLowercase --private' "
  echo "3) Run 'git remote add origin git@github.com:icodeyou/$nameLowercase.git' "
  echo "4) Run 'git 'git push -u origin master' "

  echo ""
  echo "If you have this message : 'To authenticate, please run gh auth login.' ➡️ Follow steps below :"
  echo "1) Run 'gh auth login' "
  echo "2) Run 'gh repo create $nameLowercase --private' "
  echo "3) Run 'git remote add origin git@github.com:icodeyou/$nameLowercase.git' "
  echo "4) Run 'git 'git push -u origin master' "

  echo ""
  echo ""
  echo "🎉 Project uploaded"
  echo ""
  echo ""
  echo "The project has been uploaded to : https://github.com/icodeyou/$nameLowercase.git"
fi

# Mason
echo ""
echo ""
echo "🔥🔥🔥 MASON (hello_riverpod) 🔥🔥🔥"
echo ""
echo ""
mkdir mason
cd mason
mason init
mason add hello_riverpod
mason make hello_riverpod --on-conflict overwrite -o ../ --projectName $nameLowercase
cd ..
sed -i '' "s/Flutter App/$nameUppercase/g" lib/app/app.dart
echo ""
echo "ℹ️ Now running 'flutter pub get' :"
echo ""
flutter pub get
flutter pub upgrade --major-versions
echo ""
echo "⚠️ If pubspec.yaml has been modified,"
echo "⚠️ it might be time to upgrade pubspec.yaml in hello_riverpod"
flutter pub run build_runner build --delete-conflicting-outputs
echo ""
echo "🔥 Mason finished"

# Commit and push
echo ""
echo ""
git add --all 
git commit -m "Mason template ✨"
echo "🎉 Commit README Mason"

if [[ $githubAnswer != 'NO' ]]; then 
  echo "🎯 LAST STEP : PUSH"
  git push
  echo ""
  echo ""
  echo "The project has been uploaded to : https://github.com/icodeyou/$nameLowercase.git"
fi


echo ""
echo ""
echo "✅ ✅ ✅ ✅ ✅ "
echo "✅ FINISHED ✅"
echo "✅ ✅ ✅ ✅ ✅ "

echo "The project has been created in : $projectPath"

echo ""
echo ""