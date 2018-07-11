#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Required root permission"
  exit 1
fi

################################################################################
# Prequisite
################################################################################
mkdir ~/workspace && cd ~/workspace

# Download all configure file from github
git clone https://github.com/pingsoli/dotfiles.git

################################################################################
# Essential tools
################################################################################
# for ag (https://github.com/ggreer/the_silver_searcher)
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

# samba network sharing service, sharing files between windows and linux.
sudo apt-get install -y cifs-utils


# Install vim from source code
#source ./install_vim.sh

#source ./install_tmux.sh
#source ./install_fish.sh
#source ./install_pyenv.sh
