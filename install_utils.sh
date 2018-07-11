#!/bin/bash

# essential tools
sudo apt-get install -y git cmake curl

# spy resources
# htop - watch the process activities.
# iftop - watch the download and upload speed
# tcpdump - capture datagram
# ncdu - check the disk space usage
sudo apt-get install -y htop iftop tcpdump
sudo apt install -y ncdu

# ssh server
sudo apt-get install -y openssh-server
