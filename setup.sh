#!/bin/bash
clear

# commands
export alias mkdirp="mkdir -p"
export alias chshs="chsh -s"
export alias rmf="rm -f"
export alias saddrepo="sudo add-apt-repository"
export alias saptget="sudo apt-get"
export alias sapt="sudo apt"

echo "Updating repositories..."
echo "Make sure you're online"

# update packages
sapt       update  2>> ~/setup-err.log
saptget    update  2>> ~/setup-err.log
saptget -y upgrade 2>> ~/setup-err.log
sapt -y    upgrade 2>> ~/setup-err.log
echo

# install wget
echo "Installing wget"
sapt -y install wget      >> ~/setup.log 2>> ~/setup-err.log

# download oh-my-zsh installer for termux
echo "Downloading oh-my-zsh theme installer..."
wget https://raw.githubusercontent.com/Cabbagec/termux-ohmyzsh/master/install.sh >> ~/setup.log 2>> ~/setup-err.log
chmod 700 ./install.sh    >> ~/setup.log 2>> ~/setup-err.log
echo "Done"
echo

echo -e "You'll be asked to choose:
1. A color theme: u better enter 0
2. Font: Source code pro is 24"
echo

# install necessary packages
echo "Installing packages..."
sleep 7
sapt -y install zsh     >> ~/setup.log 2>> ~/setup-err.log
echo "Installed zsh shell"
sapt -y install git     >> ~/setup.log 2>> ~/setup-err.log
echo "Installed git"
sapt -y install openssh >> ~/setup.log 2>> ~/setup-err.log
echo "Installed openssh"
sapt -y install vim     >> ~/setup.log 2>> ~/setup-err.log
echo "Attempting vim installation"
saptget -y install vim  >> ~/setup.log 2>> ~/setup-err.log
echo "Installed vim"
sapt -y install figlet  >> ~/setup.log 2>> ~/setup-err.log
echo "Installed figlet"
sapt -y install fortune >> ~/setup.log 2>> ~/setup-err.log
echo "Installed fortune"
sapt -y install termux-elf-cleaner >> ~/setup.log 2>> ~/setup-err.log
echo "Installed termux-elf-cleaner"
echo

echo "Installing themes: oh-my-zsh..."
rm ~/storage -rf  2>> ~/setup-err.log
./install.sh      2>> ~/setup-err.log

echo "Setting up shell..."
cp ./agnoster.zsh-theme   ~/.oh-my-zsh/themes/agnoster.zsh-theme >> ~/setup.log 2>> ~/setup-err.log
cp ./*.properties         ~/.termux/                             >> ~/setup.log 2>> ~/setup-err.log
cp ./.*                   ~/                                     >> ~/setup.log 2>> ~/setup-err.log

echo "Cleaning ELFs from binaries..."
termux-elf-cleaner $BIN/*                                        >> ~/setup.log 2>> ~/setup-err.log
echo "Done"
echo

read -p "Press ENTER to continue "
echo -e "Environment variables:
- termux root using \$ROOT
- bin using \$BIN
- usr using \$USR

Git shortcuts:
- ga to add files
- gc to commit
- gp to push

Vim has been setup
Pinch to zoom"
read -p "Press ENTER to continue "
cd

rm $PREFIX/etc/motd                      2>> ~/setup-err.log
termux-reload-settings    >> ~/setup.log 2>> ~/setup-err.log
rm ~/storage -rf
ln -s /sdcard/ ~/storage
mkdirp /sdcard/GitHub
ln -s /sdcard/GitHub
mkdirp ~/Archive

thisDir = "$(basename $PWD)"
cd
mv ~/"$thisDir" ~/Archive/
mv ~/termux-ohmyzsh ~/Archive/
rm .bash* -rf

echo -e "Setup complete, logs saved in
- ~/setup.log
- ~/setup-err.log

Please restart termux"
