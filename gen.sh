#!/bin/bash

# Usage :

# ./gen.sh snowball
# ./gen.sh snowball withoutNavBar
# ./gen.sh snowball withNavBar

# ./gen.sh local
# ./gen.sh local withoutNavBar
# ./gen.sh local withNavBar

# ./gen.sh mason
# ./gen.sh mason withoutNavBar
# ./gen.sh mason withNavBar

# ./gen.sh master
# ./gen.sh master withoutNavBar
# ./gen.sh master withNavBar

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $SCRIPTPATH

genType=$1
if [[ $genType != "snowball" ]] && [[ $genType != "mason" ]] && [[ $genType != "local" ]] && [[ $genType != "master" ]] 
  then
    echo ""
    echo "ERROR"
    echo "Please type the following command : './gen.sh <ARGUMENT>'"
    echo "<ARGUMENT> can be : local, mason, snowball, or master"
    echo ""
    exit
fi

echo ""
echo "Prerequisites : Make sure that following CLI are installed :"
echo "flutter, mason, gh"
echo ""

if [[ $genType == "snowball" ]]
  then

    # Get name of project
    echo "Enter the name of the project (ex: Kitten Land) : "
    read nameUppercase
    if [[ $nameUppercase == "" ]]
      then
        echo "The name of your project is invalid. Please start again."
        exit
    fi
    nameLowercase=$(echo "$nameUppercase" | awk '{print tolower($0)}' | tr -d ' ')

    # Check if SNOWBALLS folder exists in this path
    if ! [ -d "SNOWBALLS" ]; then
      mkdir SNOWBALLS
      else 
        # Check if project already exists in SNOWBALLS/
        if [ -d "SNOWBALLS/$nameLowercase" ]; then
          echo "$nameLowercase does exist in SNOWBALLS/"
          echo "Delete the folder or choose another name for your project."
          echo ""
          exit
        fi
    fi

    # Get Bundle ID for project
    org="com.$nameLowercase"
    echo "⚠️ Your organization is by default : $org"
    echo "If this is OK, press enter. Otherwise type the name of your new org :"
    read newOrg
    if [[ $newOrg != '' ]]; then org="$newOrg"; fi
    bundleId="$org.$nameLowercase"
    echo ""
    echo "✨ ✨ ✨ ✨ ✨"
    echo "The Bundle ID of the project will be : $bundleId"
    echo "Are you okay with that ? Press enter to confirm, type NO otherwise :"
    read bundleIdAnswer
    if [[ $bundleIdAnswer == 'NO' ]]; then
      echo "The last part of your bundle ID has to be your app name (so that we can run 'flutter create .' in the future)"
      echo "Please start again."
      exit
    fi
    echo ""
  
  else
    nameLowercase=project$genType
    org="com.$nameLowercase"
    bundleId="$org.$nameLowercase"
fi

# Navigate to the folder where the project will be created
echo ""
echo "Navigate to the folder where the project will be created"
echo "📂 From $PWD"
case "$genType" in
"local")
    rm -rf LOCAL/; mkdir LOCAL/ || exit # Safest way to clear LOCAL/ including empty files
    # Plus it creates the directory if it does not exist
    cd LOCAL/ || exit
    ;;
"snowball")
    # Folder cannot be called SNOWBALL because it would be a conflict with the branch name (it makes checkout impossible !)
    cd SNOWBALLS/ || exit
    ;;
"master")
    rm -rf MASTERBRANCH/; mkdir MASTERBRANCH/
    # Folder cannot be called MASTER because it would not be opened in VS Code.
    cd MASTERBRANCH/ || exit
    ;;
"mason")
    rm -rf MASON/; mkdir MASON/ || exit
    cd MASON/ || exit
    ;;
*)
    echo "ERROR : Argument is not recognized"
    exit
    ;;
esac 

echo ""
echo "Checking navbar"
if [[ "$2" == "withoutNavBar" ]]; then
  echo "Navbar : false"
  masonNavbarArgument="--navBar false"
elif [[ "$2" == "withNavBar" ]]; then
  echo "Navbar : true"
  masonNavbarArgument="--navBar true"
else
  masonNavbarArgument=""
fi

echo "📂 To $PWD"
echo ""
echo "🔥 Creating project '$nameLowercase' with bundle ID '$bundleId'"
echo ""
flutter create $nameLowercase --platforms=ios,android --org $org --empty

# Navigate inside new project
echo ""
case "$genType" in
"local")
    echo "Move app to LOCAL/"
    mv $nameLowercase ../ # Move app to hello_riverpod
    cd ..
    rm -rf LOCAL/ # Delete empty LOCAL
    mv $nameLowercase LOCAL # Rename app to LOCAL
    echo ""
    echo "Navigate inside new project"
    echo "📂 From $PWD"
    cd LOCAL
    echo "📂 To $PWD"
    ;;
"snowball")
    echo "Navigate inside new project"
    echo "📂 From $PWD"
    cd $nameLowercase
    echo "📂 To $PWD"
    ;;
"master")
    echo "Move app to MASTERBRANCH/"
    mv $nameLowercase ../ # Move app to hello_riverpod
    cd ..
    rm -rf MASTERBRANCH/ # Delete empty MASTERBRANCH
    mv $nameLowercase MASTERBRANCH # Rename app to MASTERBRANCH
    echo ""
    echo "Navigate inside new project"
    echo "📂 From $PWD"
    cd MASTERBRANCH
    echo "📂 To $PWD"
    ;;
"mason")
    echo "Move app to MASON/"
    mv $nameLowercase ../ # Move app to hello_riverpod
    cd ..
    rm -rf MASON/ # Delete empty MASON
    mv $nameLowercase MASON # Rename app to MASON
    echo ""
    echo "Navigate inside new project"
    echo "📂 From $PWD"
    cd MASON
    echo "📂 To $PWD"
    ;;
*)
    echo "ERROR : Argument is not recognized"
    exit
    ;;
esac 

projectPath=$PWD

# Create Git and commit
echo ""
echo ""
echo "😼 Creating Git Repository for project $nameLowercase"
git init
git add --all
git commit -m "First commit 🦋"

createRemoteRepo() {
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
}

# Git push for snowball projects
if [[ $genType == "snowball" ]]; then
  while true; do
    echo "Do you want to push the repo to Github? (Y/N): "
    read answer
    case $answer in
      [Yy]* ) echo "👍 Creating the remote repository"; createRemoteRepo; break;;
      [Nn]* ) echo "👎 Skipping remote config"; break;;
      * ) echo "❌ Invalid input. Please enter Y or N.";;
    esac
  done
fi

# Mason
echo ""
echo ""
echo "🔥🔥🔥 MASON (hello_riverpod) 🔥🔥🔥"
echo ""
echo ""
mkdir mason
echo "Navigate to mason folder"
echo "📂 From $PWD"
cd mason
echo "📂 To $PWD"
echo ""
echo "🔥 Mason init"
mason init

echo ""
echo "🔥 Mason add brick"
case "$genType" in
"local")
    mason add hello_riverpod --path ../../
    ;;
"snowball")
    mason add hello_riverpod --git-url https://github.com/icodeyou/hello_riverpod.git  --git-ref snowball
    ;;
"master")
    mason add hello_riverpod --git-url https://github.com/icodeyou/hello_riverpod.git  --git-ref master
    ;;
"mason")
    mason add hello_riverpod
    ;;
*)
    echo "ERROR : Argument is not recognized"
    exit
    ;;
esac 

echo ""
echo "🔥 Mason make"
mason make hello_riverpod $masonNavbarArgument --on-conflict overwrite -o ../ --projectName $nameLowercase

echo ""
echo "Navigate back to app"
echo "📂 From $PWD"
cd ..
echo "📂 To $PWD"

# This will set up Terminals Manager
if [[ $genType == 'snowball' ]] ||  [[ $genType == 'local' ]]; then 
  echo ""
  echo "Rename file terminals_template.json to terminals.json"
  mv .vscode/terminals_template.json .vscode/terminals.json || exit
fi

echo ""
echo "ℹ️ Now running 'flutter pub get' :"
echo ""
flutter pub get
flutter pub upgrade --major-versions

echo ""
echo "⚠️ If pubspec.yaml has been modified,"
echo "⚠️ it might be time to upgrade pubspec.yaml in hello_riverpod"

echo ""
echo "ℹ️ Running build_runner"
dart run build_runner build --delete-conflicting-outputs

echo ""
echo "ℹ️ Running Slang build"
dart run slang

echo ""
echo "🔥 Mason finished"

# Git commit
echo ""
echo ""
git add --all 
git commit -m "Mason template ✨"
echo "🎉 Commit Mason"

# Git push
if [[ $genType == "snowball" ]]
  then
    if [[ $githubAnswer != 'NO' ]]; then 
      echo "🎯 LAST STEP : PUSH"
      git push
      echo ""
      echo ""
      echo "The project has been uploaded to : https://github.com/icodeyou/$nameLowercase.git"
    fi
fi

echo ""
echo ""
echo "✅ ✅ ✅ ✅ ✅ "
echo "✅ FINISHED ✅"
echo "✅ ✅ ✅ ✅ ✅ "

echo "The project has been created in : $projectPath"

# Method to run the project
runProject() {
  echo ""
  echo "🚀 🚀 🚀 🚀 🚀 🚀 🚀"
  echo "RUNNING PROJECT"
  echo ""
  
  # Run flutter in the background
  flutter run &
  
  # Get the process ID ($!) of the last background process, which is flutter run
  flutter_pid=$!

  # Allow some time for the app to start up
  sleep 120

  echo ""
  echo "🌈 FLUTTER RUN IS FINISHED 🌈"
  echo ""

  if [[ $genType == "local" ]]; then
    echo "Do you want to commit the changes that have been made after the build?"
    echo "If you do, press enter to confirm, otherwise any other key :"
    read -n1 commitAnswer
    echo ""
    echo "Thank you for your answer."
  else
    commitAnswer=''
  fi
  
  if [[ $commitAnswer == '' ]]; then
    git add --all 
    git commit -m "clean: upgrade project files after first run ✨"
  fi

  echo ""
  echo "ℹ️ We need to stop the Flutter process because we ran the app in the background to be able to commit the files created after the first run."
  echo "If you want to hot reload/restart, you have to launch 'flutter run' again."
  echo ""

  # Stopping the Flutter run process
  echo "Stopping the Flutter run process..."
  kill -9 "$flutter_pid"

  # Verify if flutter process is stopped
  sleep 5
  if ps -p "$flutter_pid" > /dev/null; then
    echo "❌ Flutter is still running"
  else
    echo "✅ Flutter stopped."
  fi
}

runProject
