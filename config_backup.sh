#!/bin/bash

VIM_CONF="$HOME/.vimrc"
TMUX_CONF="$HOME/.tmux.conf"
FISH_CONF="$HOME/.config/fish"

BACKUP_DIR="./.config"

cp -r "$FISH_CONF" "$BACKUP_DIR"
cp    "$VIM_CONF"  "$BACKUP_DIR"
cp    "$TMUX_CONF" "$BACKUP_DIR"
