#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELL='\033[0;33m'
BLU='\033[0;34m'
NC='\033[0m' # No Color
programs=(Nodejs Gulp Foreverjs MongoDB)

function printInstallingMessage {
  printf "${GREEN}Installing $1...${NC}\n"
}

function installNode {
  printInstallingMessage Nodejs
  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

function installMongo {
  printInstallingMessage MongoDB
  # Import the public key used by the package management system
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
  # Create a list file for MongoDB
  echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
  # Reload local package database.
  sudo apt-get update
  # Install the MongoDB packages
  sudo apt-get install -y mongodb-org
}

function installGulp {
  printInstallingMessage Gulp
  sudo npm i -g gulp-cli
}

function installForever {
  printInstallingMessage Foreverjs
  sudo npm i -g forever
}

function install {
  install=false
  while true; do
    read -p "Do you wish to install $1? [y/n] " yn
    case $yn in
        [Yy]* ) install=true; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
  done

  if [ $install = true ]
  then
    case $1 in
      Nodejs) installNode;;
      Gulp) installGulp;;
      Foreverjs) installForever;;
      MongoDB) installMongo;;
    esac
  fi
}


# Fix for language problem
export LC_ALL=C
sudo echo "LC_ALL=en_US.UTF-8" > /etc/default/locale
sudo echo "LANGUAGE=en_US" >> /etc/default/locale
sudo echo "LANG=en_US.UTF-8" >> /etc/default/locale
sudo useradd nodejs -m -s /bin/bash

for i in "${programs[@]}"
do
  install $i
done

printf "${GREEN}Setup completed, enjoy! ^^${NC}\n"
printf "Please use the user ${YELL}nodejs${NC} to run your nodejs process\n connect as nodejs using ${BLU}sudo su nodejs${NC}, add your public ssh key if you want"
