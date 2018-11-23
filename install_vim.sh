#!/bin/bash

################################################################################
# NOTE:
# Ubuntu 18.04.1 LTS has built-in vim 8.0.1453.
# Ubuntu 16.05.1 LTS has built-in vim 7.x.xxxx.
# More conveninet way to install vim, `sudo apt install -y vim` will satifies you.
################################################################################

################################################################################
# Install from ubuntu repository
################################################################################
# sudo apt install -y vim

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
# Remember to move your configuration file to specific location.
