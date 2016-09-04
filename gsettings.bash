#!/bin/bash

gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.Unity.Launcher favorites "['application://google-chrome.desktop', 'application://sublime-text.desktop', 'application://terminator.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
gsettings set org.gnome.settings-daemon.plugins.power critical-battery-action 'shutdown'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'
gsettings set de.mh21.indicator.multiload.general width '500'
gsettings set de.mh21.indicator.multiload.general speed '100'
gsettings set com.canonical.indicator.datetime show-date true
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
