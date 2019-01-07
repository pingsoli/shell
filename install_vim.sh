#!/bin/bash

################################################################################
# NOTE:
# Ubuntu 18.04.1 LTS has built-in vim 8.0.1453.
# Ubuntu 16.05.1 LTS has built-in vim 7.x.xxxx.
################################################################################
sudo apt install -y curl vim

################################################################################
# Install vim from source code
################################################################################
# Python is install by pyenv (Python version manager)
# ./configure --prefix=/usr/local/vim \
#   --enable-python3interp=yes \
#   --with-python3-command=~/.pyenv/versions/3.6.5/bin/python3.6
#
# make && sudo make install

################################################################################
# Install YouCompleteMe plugin for vim.
################################################################################
# more detail: https://github.com/Valloric/YouCompleteMe#linux-64-bit
# python3 install.py --clang-completer
#
# NOTE: Remember to move your configuration file to specific location.

source ./config.sh
YCM_HOME="$MY_HOME/.vim/bundle/YouCompleteMe"

if [ -d "$YCM_HOME" ]; then
  cd "$YCM_HOME"

  sudo apt install -y build-essential cmake python3-dev
  sudo git submodule update --init --recursive

  # Fetch all submodules
  # sudo git pull --recurse-submodule
  # sudo git submodule update --remote --recursive

  # Compile YouCompleteMe for c++ programming in vim
  sudo python3 install.py --clang-completer

  cd "$MY_HOME"
fi
