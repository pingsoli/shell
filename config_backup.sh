#!/bin/bash

VIMRC="/etc/vim/vimrc.local"
VIM_CONF="$HOME/.vimrc"
TMUX_CONF="$HOME/.tmux.conf"

BACKUP_DIR="./.config"

cp "$VIMRC"     "$BACKUP_DIR"
cp "$VIM_CONF"  "$BACKUP_DIR"
cp "$TMUX_CONF" "$BACKUP_DIR"
