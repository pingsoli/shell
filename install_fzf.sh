#!/bin/bash

# NOTE: Installation of fzf is very slow, this process will download something
# automatically.
# If you install failed, you can download the fzf bin file separately.
# more detail: https://github.com/junegunn/fzf-bin/releases

source ./config.sh
git clone --depth 1 https://github.com/junegunn/fzf.git "$MY_HOME/.fzf"
"$MY_HOME/.fzf/install"
