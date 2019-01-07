#!/bin/bash

################################################################################
# Spy resources
################################################################################
# htop     - watch the process activities.
# iftop    - watch the download and upload speed
# ncdu     - check the disk space usage
# tcpdump  - capture datagram
# valgrind - Check memory leak or detect bugs
install htop iftop tcpdump ncdu valgrind

# Remote login by SSH. P.S. the service will be run automatically after
# finishing installation.
install openssh-server

# C/C++ compiler and tools
install gcc cmake autoconf automake pkg-config

# Drag files to transfer from windows to linux under xshell
install lrzsz

# Deploy python3 environment
install python3.6 python3-pip
sudo ln -fs /usr/bin/python3.6 /usr/bin/python
