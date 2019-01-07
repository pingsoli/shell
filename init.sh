#!/bin/bash
# Run current script to custom your ubuntu system.
# You can also run the separate script for you own requirements.

if [[ $EUID -ne 0 ]]; then
  echo "Required root permission"
  exit 1
fi

install()
{
  # POSIX way to install software if not exist.
  for var in "$@"
  do
    command -v "$var" >/dev/null 2>&1 || { sudo apt install -y "$var"; }
  done
}

source ./config.sh
source ./remove_and_create_dirs.sh

source ./install_utils.sh
source ./install_samba.sh
source ./install_vim.sh
source ./install_tmux.sh
source ./install_fish.sh
# source ./install_pyenv.sh

source ./change_timezone.sh
source ./boot_showing_ip.sh
