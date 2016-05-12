#!/bin/bash

# adds repos
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# install apps
sudo apt-get -y --force-yes install \
	gitk vim sublime-text-installer

# autoremove 
sudo apt-get autoremove

# folders
rm -rf ~/Public
rm -rf ~/Pictures
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music
rm ~/examples.desktop
mkdir ~/Development
mkdir ~/Figures

# run additional configuration scripts
bash ./git-settings.bash

# prompt for a reboot
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
