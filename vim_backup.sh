#!/bin/bash

VIMRC="/etc/vim/vimrc.local"
VIM_CONF="$HOME/.vimrc"
TMUX_CONF="$HOME/.tmux.conf"

cp "$VIMRC"     .
cp "$VIM_CONF"  .
cp "$TMUX_CONF" .
