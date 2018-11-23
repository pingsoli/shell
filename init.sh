#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Required root permission"
  exit 1
fi

################################################################################
# Prequisites
################################################################################
MY_HOME="/home/pingsoli"
MY_WORKSPACE="$MY_HOME/workspace"

if [ ! -d "$MY_WORKSPACE" ]; then
  echo "creating and changing to directory $MY_WORKSPACE"
  mkdir "$MY_WORKSPACE" && cd "$MY_WORKSPACE"
else
  echo "'$MY_WORKSPACE' already exists"
fi

install()
{
  # POSIX way to install software if not exist.
  for var in "$@"
  do
    command -v "$var" >/dev/null 2>&1 || { sudo apt install -y "$var"; }
  done
}

source ./install_utils.sh
source ./install_samba.sh

# git clone https://github.com/pingsoli/dotfiles.git
# git clone https://github.com/pingsoli/shell-scripts.git

# Install vim from source code
# source ./install_vim.sh
# source ./install_tmux.sh
# source ./install_fish.sh
# source ./install_pyenv.sh
