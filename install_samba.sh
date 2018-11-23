#!/bin/bash

################################################################################
# Light way
################################################################################
# Samba network sharing service, sharing files between windows and linux.
# NOTE: No samba server installed, just provide the access to network files.
#
# Mount
# sudo mount.cifs -o username="xxx",password="xxxx",uid=pingsoli,gid=pingsoli //192.168.1.2 ./share
#
# Unmount
# sudo umount -a -t cifs -l
# sudo umount -f share
# 'f' stands for 'force', more detail: `man umount`.
install cifs-utils

################################################################################
# Samba server Installation (Heavy way)
################################################################################
# sudo apt-get -y install samba

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
