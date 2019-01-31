#!/bin/bash
# Installing neccessary tools on Centos 7.

################################################################################
# ERROR: User is not suoders.
# $ su root
# # visudo
# add new line `pingosli ALL=(ALL) ALL`
################################################################################

sudo yum -y install wget curl
sudo yum -y install bash-completion bash-completion-extras

################################################################################
# Connect to network automatically.
################################################################################
# Centos not connect wireless network automaticallly.
# open /etc/sysconfig/network-scripts/ifcfg-eth0, and change 'ONBOOT=yes'.


################################################################################
# Install GUI (GNOME or KDE)
################################################################################
# the installation takes too much time.
# sudo yum -y groups install "GNOME Desktop"
# yum -y groups install "KDE Plasma Workspaces"

# Start GUI on terminal
# sudo startx

# vim has been installed when GNOME has been installed, you can also install vim
# separately.
sudo yum -y install vim


################################################################################
# SSH remote access
################################################################################
# Solve `WARNING! The remote SSH server rejected X11 forwarding request.`
sudo yum -y install xorg-x11-xauth


################################################################################
# Centos 7 install devtoolset-3
################################################################################
sudo yum -y install centos-release-scl
sudo yum -y install devtoolset-3

# Start using software collection, check out the gcc version.
# scl enable devtoolset-3 bash

# List individual components included in this collection
# yum list devtoolset-3\*


################################################################################
# Samba server, share files between linux and windows hosts.
################################################################################
# sudo yum -y install samba-client samba-common cifs-utils
