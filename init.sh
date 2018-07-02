#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Required root permission"
  exit 1
fi

################################################################################
# Prequisite
################################################################################
mkdir _/downloads
mkdir ~/workspace && cd ~/workspace

# Download all configure file from github
git clone https://github.com/pingsoli/dotfiles.git

################################################################################
# Essential tools
################################################################################
sudo apt-get install -y git cmake curl
sudo apt-get install -y htop iftop tcpdump

# for ag (https://github.com/ggreer/the_silver_searcher)
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

# samba network sharing service
sudo apt-get install -y cifs-utils

sudo apt-get install -y openssh-server
sudo service start ssh


################################################################################
# Important tools
################################################################################

# Install vim from source code
#source ./install_vim.sh

#source ./install_tmux.sh
#source ./install_fish.sh
#source ./install_pyenv.sh
