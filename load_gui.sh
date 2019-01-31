#!/bin/bash

# Use the following command to start specific GUI
# startx         # Boot into default desktop
# unity          # Unity
# unity-2d-shell # Unity 2D
# gnome-shell    # Gnome

# Disable Gnome screensaver and screen-lock
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
