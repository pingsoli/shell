#!/bin/bash

sudo apt install -y fish

################################################################################
# Set fish as default terminal
################################################################################
# Change default terminal for root account.
sudo chsh -s /usr/bin/fish

source ./config.sh
# Change default terminal for specific user
sudo chsh -s /usr/bin/fish "$MY_NAME"
