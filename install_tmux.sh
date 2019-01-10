#!/bin/bash

sudo apt install -y tmux

################################################################################
# Install tmux from source code.
# https://github.com/tmux/tmux
# NOTE: Install libevent and ncurses with default configuration is much easier.
################################################################################
# First, install libevent
# more details: http://libevent.org

# Second, install ncurses
# more details: http://invisible-island.net/ncurses/

# Finally, install tmux.
# ./configure --prefix=/usr/local/tmux
# make
# sudo make install

# Create symbolic link for tmux.
# cd /usr/local/bin
# ln -s /usr/local/tmux/bin/tmux tmux
