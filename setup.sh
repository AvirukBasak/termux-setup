#!/bin/bash
echo "Updating repositories..."
echo "Make sure you're online"
apt update 2>> ~/setup-err.log
apt-get update 2>> ~/setup-err.log
echo "Installing wget"
pkg install wget >> ~/setup.log 2>> ~/setup-err.log
echo "Downloading oh-my-zsh theme installer..."
wget https://raw.githubusercontent.com/Cabbagec/termux-ohmyzsh/master/install.sh >> ~/setup.log 2>> ~/setup-err.log
chmod 700 ./install.sh >> ~/setup.log 2>> ~/setup-err.log
echo "Done"
echo
echo -e "You'll be asked to choose:
1. A color theme: u better enter 0
2. Font: Source code pro is 24"
echo
echo "Installing packages..."
sleep 7
pkg install zsh >> ~/setup.log 2>> ~/setup-err.log
echo "Installed zsh shell"
pkg install git >> ~/setup.log 2>> ~/setup-err.log
echo "Installed git"
apt -y install vim >> ~/setup.log 2>> ~/setup-err.log
echo "Attempting vim installation"
apt-get -y install vim >> ~/setup.log 2>> ~/setup-err.log
echo "Installed vim"
pkg install figlet >> ~/setup.log 2>> ~/setup-err.log
echo "Installed figlet"
pkg install fortune >> ~/setup.log 2>> ~/setup-err.log
echo "Installed fortune"
pkg install termux-elf-cleaner >> ~/setup.log 2>> ~/setup-err.log
echo "Installed termux-elf-cleaner"
echo
echo "Installing themes: oh-my-zsh..."
./install.sh 2>> ~/setup-err.log
echo "Setting up shell..."
cp ./agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
cp ./*.properties ~/.termux/
cp ./.* ~/
echo "Cleaning ELFs from binaries..."
termux-elf-cleaner $BIN/* >> ~/setup.log 2>> ~/setup-err.log
echo "Done"
echo
echo "Installing GitEasy-Bash"
git clone https://github.com/OogleGlu/GitEasy-Bash.git >> ~/setup.log 2>> ~/setup-err.log
cd GitEasy-Bash/
./termux-install.sh >> ~/setup.log 2>> ~/setup-err.log
rm -rf GitEasy-Bash
echo "Done"
echo
echo "Login to GitHub account"
gauth
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
cd
rm $PREFIX/etc/motd
termux-reload-settings >> ~/setup.log 2>> ~/setup-err.log
mkdir GitHub/
echo -e "Setup complete, logs saved in
- ~/setup.log
- ~/setup-err.log

Please restart termux"
