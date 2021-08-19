#!/bin/bash
clear
echo "Updating repositories..."
echo "Make sure you're online"
# update packages
apt update 2>> ~/setup-err.log
apt-get update 2>> ~/setup-err.log
apt-get -y upgrade 2>> ~/setup-err.log
apt -y upgrade 2>> ~/setup-err.log
echo
# install wget
echo "Installing wget"
apt -y install wget >> ~/setup.log 2>> ~/setup-err.log
# download oh-my-zsh installer for termux
echo "Downloading oh-my-zsh theme installer..."
wget https://raw.githubusercontent.com/Cabbagec/termux-ohmyzsh/master/install.sh >> ~/setup.log 2>> ~/setup-err.log
chmod 700 ./install.sh >> ~/setup.log 2>> ~/setup-err.log
echo "Done"
echo
echo -e "You'll be asked to choose:
1. A color theme: u better enter 0
2. Font: Source code pro is 24"
echo
# install necessary packages
echo "Installing packages..."
sleep 7
apt -y install zsh >> ~/setup.log 2>> ~/setup-err.log
echo "Installed zsh shell"
apt -y install git >> ~/setup.log 2>> ~/setup-err.log
echo "Installed git"
apt -y install openssh >> ~/setup.log 2>> ~/setup-err.log
echo "Installed openssh"
apt -y install vim >> ~/setup.log 2>> ~/setup-err.log
echo "Attempting vim installation"
apt-get -y install vim >> ~/setup.log 2>> ~/setup-err.log
echo "Installed vim"
apt -y install figlet >> ~/setup.log 2>> ~/setup-err.log
echo "Installed figlet"
apt -y install fortune >> ~/setup.log 2>> ~/setup-err.log
echo "Installed fortune"
apt -y install termux-elf-cleaner >> ~/setup.log 2>> ~/setup-err.log
echo "Installed termux-elf-cleaner"
echo
echo "Installing themes: oh-my-zsh..."
rm ~/storage -rf 2>> ~/setup-err.log
./install.sh 2>> ~/setup-err.log
echo "Setting up shell..."
cp ./agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme >> ~/setup.log 2>> ~/setup-err.log
cp ./*.properties ~/.termux/ >> ~/setup.log 2>> ~/setup-err.log
cp ./.* ~/ >> ~/setup.log 2>> ~/setup-err.log
echo "Cleaning ELFs from binaries..."
termux-elf-cleaner $BIN/* >> ~/setup.log 2>> ~/setup-err.log
echo "Done"
echo
echo "Installing GitEasy-Bash"
git clone https://github.com/OogleGlu/GitEasy-Bash.git >> ~/setup.log 2>> ~/setup-err.log
cd GitEasy-Bash/
./termux-install.sh >> ~/setup.log 2>> ~/setup-err.log
cd ../
echo "Done"
echo
echo "Login to GitHub account"
gauth
read -p "Press ENTER to continue "
echo -e "Environment variables:
- termux root using \$ROOT
- bin using \$BIN
- usr using \$USR

Git shortcuts:
- gauth to re-login to YOUR github acc in termux
- gclone to clone from YOUR repositories
- ginit to initialize YOUR repos
- ga to add files
- gc to commit
- gp to push
- git restore to undo uncommited
  changes.

Vim has been setup
Pinch to zoom"
read -p "Press ENTER to continue "
cd
rm $PREFIX/etc/motd 2>> ~/setup-err.log
termux-reload-settings >> ~/setup.log 2>> ~/setup-err.log
rm ~/storage -rf
ln -s /sdcard/ ~/storage
mkdir /sdcard/GitHub
ln -s /sdcard/GitHub
mkdir ~/Archive
thisDir = "$(basename $PWD)"
cd
mv ~/"$thisDir" ~/Archive/
mv ~/termux-ohmyzsh ~/Archive/
rm .bash* -rf
echo -e "Setup complete, logs saved in
- ~/setup.log
- ~/setup-err.log

Please restart termux"
