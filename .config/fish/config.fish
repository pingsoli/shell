# Aliases for all shelles
alias ..="cd .."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."

# Tmux 256 color-mode
alias tmux="tmux -2"

# Typo aliases
alias maek="make"
alias meak="make"
alias amek="make"
alias mkae="make"
alias mak="make"
alias sl="ls"
alias l="ll"

set -g MY_WORKSPACE $HOME/workspace

# Convenient aliases
alias cdw="cd $MY_WORKSPACE"
alias vi="vim"
alias vimconfig="vim ~/.vimrc"

alias cdfish="cd ~/.config/fish"
alias fishconfig="vim ~/.config/fish/config.fish"
alias sourcefish="source ~/.config/fish/config.fish"
alias tmuxconfig="vim ~/.tmux.conf"
alias bashconfig="sudo vim /etc/bash.bashrc"

# Set fish shell greeting based
set fish_greeting

# pyenv (python version manager)
set -gx PYENV $HOME/.pyenv
set -gx PATH $PYENV/bin $PATH
