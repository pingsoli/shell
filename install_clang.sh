#!/bin/bash

################################################################################
# Install clang 6 in ubuntu 16.04
# https://blog.kowalczyk.info/article/k/how-to-install-latest-clang-6.0-on-ubuntu-16.04-xenial-wsl.html
################################################################################
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main"
sudo apt-get update
sudo apt-get install -y clang-6.0

# Reconfigure the system so that clang refers to clang6
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 1000
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 1000

# Set clang as default compiler.
# If you use fish shell, please add this to your config.fish
#  set -gx CC /usr/bin/clang
#  set -gx CXX /usr/bin/clang++
#
# If you use bash shell, please add this to your /etc/bash.bashrc
#  export CC=/usr/bin/clang
#  export CXX=/usr/bin/clang++

################################################################################
