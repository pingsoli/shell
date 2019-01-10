#!/bin/bash
# This script is the entry point of customing ubuntu system.
# You can also run each script separately.

if [[ $EUID -ne 0 ]]; then
  echo "Required root permission..., try \`sudo $0\`."
  exit 1
fi

# Run the task on a separate process, the parent process environment will not
# be inherited in child process. Take care of the differences between:
#
# `source ./remove_and_create_dirs.sh`
# and
# `./remove_and_create_dirs.sh`.
#
# source command will not open a new process, rather in current environment to
# run the script, all environment variable will be passed between scripts.
./remove_and_create_dirs.sh

./install_utils.sh
# ./install_samba.sh
# ./install_vim.sh
# ./install_fish.sh

# ./install_pyenv.sh

# ./change_timezone.sh
# ./boot_showing_ip.sh
