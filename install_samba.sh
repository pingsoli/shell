#!/bin/bash

sudo apt-get -y install samba

# Configure samba server
# vim /etc/samba/smb.conf
# add following configuration, allows root user login.
#
# [root]
# comment=root
# path=/root
# browseable=yes
# readonly=no
# smbpasswd -a root

# Restarting samba server
# /etc/init.d/samba restart
