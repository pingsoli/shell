#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Required root permission"
  exit 1
fi

sudo apt-get install -y git cmake curl


# fish shell installation
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt update
sudo apt install fish

# Set fish shell as default shell
chsh -s /usr/local/fish


# openssh installation and start the service
sudo apt-get install -y openssh-server
sudo service start ssh
