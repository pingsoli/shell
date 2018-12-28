#!/bin/bash

################################################################################
# spy resources
################################################################################
# htop    - watch the process activities.
# iftop   - watch the download and upload speed
# ncdu    - check the disk space usage
# tcpdump - capture datagram
install htop iftop tcpdump ncdu


################################################################################
# SSH server for remote login
################################################################################
install openssh-server

# Check ssh server status(after installation, openssh-server will run as daemon)
# sudo systemctl status ssh
# ps aux | grep ssh


################################################################################
# Programming tools
################################################################################
# C/C++ compiler and tools
install gcc cmake autoconf automake pkg-config

# Check memory leak or detect bugs.
install valgrind

install git

# Drag files to transfer from windows to linux under xshell.
install lrzsz
