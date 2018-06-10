#!/bin/bash

# Python is install by pyenv (Python version manager)
./configure --prefix=/usr/local/vim \
  --enable-python3interp=yes \
  --with-python3-command=~/.pyenv/versions/3.6.5/bin/python3.6

make && make install

wget --directory-prefix=~ https://raw.githubusercontent.com/pingsoli/dotfiles/master/.vimrc ~
