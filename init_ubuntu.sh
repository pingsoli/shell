#!/bin/bash

###############################################################################
# Prerequisites
# Make sure you have already installed git
#
# NOTE
# default timeout of sudo command is 20 minutes.
###############################################################################

INSTALL_DIR="~/software"

cd "$INSTALL_DIR"

# git tool
sudo apt-get install -y git

# fish terminal
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish

# set fish as default shell


# Install necessary software
# sudo apt-get install -y vim
# sudo apt-get install -y cmake
