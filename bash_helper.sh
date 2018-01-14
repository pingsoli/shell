#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Required root permission"
  exit 1
fi

bash_file="/etc/bash.bashrc"
cat >>$bash_file << 'EOF'

alias cd1="cd .."
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."
EOF
