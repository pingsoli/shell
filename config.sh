#!/bin/bash

###############################################################################
# ENV definition
###############################################################################

VIM_CONF="$HOME/.vimrc"
VIM_A_PLUGIN="$HOME/.vim/plugin/a.vim"
TMUX_CONF="$HOME/.tmux.conf"
FISH_CONF="$HOME/.config/fish"

BACKUP_DIR="./.config"

###############################################################################
# backup config file
# .vimrc, .tmux.conf, fish
###############################################################################
function backup()
{
  set -x
  cp -r "$FISH_CONF"    "$BACKUP_DIR"
  cp    "$VIM_CONF"     "$BACKUP_DIR"
  cp    "$VIM_A_PLUGIN" "$BACKUP_DIR"
  cp    "$TMUX_CONF"    "$BACKUP_DIR"
}

#function init()
#{
#  mkdir "$HOME/.vim"
#  mkdir "$HOME/.vim/plugin"
#  mkdir "$HOME/.vim/syntax"
#}

function push()
{
  git add .
  git commit -m "$1"
  git push origin master
}

###############################################################################
# Install vim plugins
###############################################################################
# function install_vim_plugins()
# {
#  cd "$HOME"

# clone all repository
# }

case "$1" in
  backup)
    backup
    ;;

  init)
    ;;

  push)
    if [ "$#" -ne 2 ]; then
      echo -e "no commit message\nusage: ./config.sh push <msg> [branch]"
      exit 2
    fi
    push "$2"
    ;;

  *)
    echo -e $"Usage: $0 { backup | init | push <msg> [branch] }"
    exit 1
esac
