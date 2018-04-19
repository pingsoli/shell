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
    echo "there is nothing"
    ;;

  *)
    echo $"Usage: $0 { backup | init }"
    exit 1
esac
