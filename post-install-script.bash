#!/bin/bash

# adds repos
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"

# ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

# gazebo
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list' 
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# install apps
sudo apt-get -y --force-yes install \
	gitk vim sublime-text-installer google-chrome-stable \
	screen terminator ssh python-pip doxygen python-wstool \
	ros-indigo-desktop python-rosinstall\
	ros-indigo-gazebo5-ros-pkgs

sudo pip install jinja2

# more ROS
sudo rosdep init
rosdep update

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

# changes to bashrc
echo "export RR_LOCATION=tokyo" >> ~/.bashrc
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
echo "alias cm=catkin_make" >> ~/.bashrc
source ~/.bashrc

# prompt for a reboot
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
