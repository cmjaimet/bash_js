#!/usr/bin/env bash

function print_title() {
  echo ""
  printf '%40s\n' | tr ' ' -
  echo "--- ${1}"
  printf '%40s\n' | tr ' ' -
}

function copy_files() {
  tar -xvf "$SOURCE_FOLDER/src.zip" -C $PWD
}

PS1 = "\W $ "
clear


print_title "SET UP JAVASCRIPT ENVIRONMENT"

SOURCE_FOLDER=$PWD
# echo $SOURCE_FOLDER
cd ~/documents
if [ ! -d "projects" ]; then
  mkdir "projects"
fi
cd projects
echo -n "Create root folder: "
read fldr
if [ ! -d "$fldr" ]; then
  mkdir "$fldr"
fi
PROJECT_FOLDER="~/documents/projects/${fldr}"
cd "$fldr"
copy_files

print_title "Install npm globally: "
sudo npm install -g npm
# npm -v

print_title "Install Node globally: "
sudo npm install -g node
# node -v

print_title "Install Gulp globally: "
sudo npm install -g gulp

print_title "Install ESLint globally: "
sudo npm install -g eslint

print_title "Initializing npm: "
npm init
npm install --save-dev gulp gulp-babel babel-preset-es2015

print_title "Initializing ESLint: "
eslint --init

echo ""
echo -n "Set up git (y/n)?"
read USE_GIT
if [ "y"==USE_GIT ]; then
  print_title "Initializing git: "
  git init
  git add -A
  git commit -m "Repo setup"
fi

print_title "Project installed in: $PROJECT_FOLDER"
