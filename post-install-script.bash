#!/bin/bash

# initial update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# required for add-apt-repository on Ubuntu 14.04
sudo apt-get -y --force-yes install software-properties-common

# for sublime
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

# for firmware
sudo add-apt-repository -y ppa:terry.guo/gcc-arm-embedded

# ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116

# gazebo
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-latest.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

# todo: make the user name an argument so the script is general
# add myself to dialout group
sudo gpasswd --add connor dialout

# update again, now that the package lists have been updated
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# install apps
sudo apt-get -y --force-yes install \
    gitk vim sublime-text-installer google-chrome-stable vlc meld rsync \
    screen terminator ssh cmake-curses-gui \
    python-pip doxygen python-wstool python-catkin-pkg python-pkg-resources \
    indicator-multiload  indicator-sensors \
    python-rosinstall gcc-arm-none-eabi openocd\

sudo pip install jinja2


# autoremove
sudo apt-get -y autoremove

# folders
rm -rf ~/Public
rm -rf ~/Pictures
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music
rm ~/examples.desktop
mkdir -p ~/development/ros/workspace/repositories
mkdir -p ~/development/ros/workspace/catkin_ws/src
mkdir -p ~/development/firmware

# sublime configuration file
cp ./Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

# run additional configuration scripts
bash ./git-settings.bash
bash ./gsettings.bash

# changes to bashrc
echo "export RR_LOCATION=tokyo" >> ~/.bashrc

# prompt for a reboot
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""
