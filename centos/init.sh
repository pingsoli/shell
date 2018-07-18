#!/bin/bash

################################################################################
# ERROR: User is not suoders.
# $ su root
# # visudo
# add new line `pingosli ALL=(ALL) ALL`
################################################################################


################################################################################
# Connect to wireless network automatically.
################################################################################
# Centos not connect wireless network automaticallly.
# open /etc/sysconfig/network-scripts/ifcfg-eth0, and change 'ONBOOT=yes'.

# Download tools, (wget, curl)
sudo yum -y install wget


################################################################################
# Install GUI (GNOME or KDE)
################################################################################
# the installation takes too much time.
sudo yum -y groups install "GNOME Desktop"
# yum -y groups install "KDE Plasma Workspaces" 

# Start GUI
# sudo startx

# vim has been installed when GNOME installing.
# sudo yum -y install vim


################################################################################
# centos 7 install devtoolset-3
################################################################################
sudo yum -y install centos-release-scl
sudo yum -y install devtoolset-3

# Start using software collection, check out the gcc version.
# scl enable devtoolset-3 bash

# List individual components included in this collection
# yum list devtoolset-3\*


################################################################################
# samba server, share files between linux and windows hosts.
################################################################################
# sudo yum -y install samba-client samba-common cifs-utils
