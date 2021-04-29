#!/bin/bash
cd ~
pkg install wget
wget https://raw.githubusercontent.com/Cabbagec/termux-ohmyzsh/master/install.sh
chmod 700 ./install.sh
echo -e "You'll be asked to choose:
1. A color theme: u better enter 0
2. Font: Source code pro is 24

Installing themes...
"
sleep 20
pkg install zsh
pkg install git
pkg install figlet
pkg install fortune
pkg install termux-elf-cleaner
./install.sh
cd ~/
cp ~/Setup/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
cp ~/Setup/*.properties ~/.termux/
cp ~/Setup/.* ~/
mkdir ~/GitHub/
cd ~/GitHub
git clone https://github.com/OogleGlu/GitEasy-Bash.git
cd GitEasy-Bash
cp g* $BIN/
cd ~/GitHub
rm -rf GitEasy-Bash
gclone DPack
cp ./src/dpack $BIN/
cp ~/
echo -e "You can access:
- termux root using \$ROOT
- bin using \$BIN
- usr using \$USR

you can use github as:
- gauth to login to YOUR github acc in termux
- gclone to clone from YOUR repositories
- ginit to initialize YOUR repos
- ga to add files
- gc to commit
- gp to push
- git restore to undo uncommited
  changes.

Vim has been setup
Pinch to zoom
"
echo "Deleted setup files"
rm -rf Setup
echo "Cleaning elfs from binaries"
termux-elf-cleaner $BIN/*
echo "Setup complete, deal with the errors"
