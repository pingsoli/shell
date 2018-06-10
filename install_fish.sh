#!/bin/bash

################################################################################
# fish shell installation
################################################################################
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt update
sudo apt install fish

# Set fish shell as default shell
chsh -s /usr/bin/fish

# fish configure file initialization
