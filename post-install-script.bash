#!/bin/bash

# adds repos
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# install apps
sudo apt-get -y --force-yes install \
	gitk vim sublime-text-installer google-chrome-stable

# autoremove 
sudo apt-get -y autoremove

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

# update system settings
gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.Unity.Launcher favorites "['application://google-chrome.desktop', 'application://sublime-text.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
gsettings set org.gnome.settings-daemon.plugins.power critical-battery-action 'shutdown'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'

# prompt for a reboot
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
