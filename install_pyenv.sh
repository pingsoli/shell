#!/bin/bash

################################################################################
# Python version manager
# https://github.com/pyenv/pyenv
# NOTE: Make sure fish shell is installed before pyenv.
################################################################################

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Modify system variable
# In fish shell, we should add this in fish config file
# often ~/.config/fish/config.fish):
#
#   set -gx PYENV $HOME/.pyenv
#   set -gx PATH $PYENV/bin $PATH
#   source (pyenv init - | psub)
#
