#!/bin/bash

# NOTE: NET-TOOLS was deprecated on newest ubuntu distributions, IPROUTE is
# provided instead.

print_footprint()
{
  local program_name="$1"
  local len=${#program_name}
  local euqal_sign_len=`expr 75 - $len`
  str=$(printf "%-${euqal_sign_len}s" "=")
  echo -e "\e[93m${str// /=}> $program_name <===\e[0m"
}

install()
{
  # POSIX way to install software if not exist.
  for var in "$@"; do

    # NOTE: `command` will not take effect on installed package, such as
    # openssh-server, lrzsz, etc.
    command -v "$var" >/dev/null 2>&1 ||\
      { sudo apt install -y "$var"; print_footprint "$var"; }
      # { sudo apt install -y "$var"; printf '=%.0s' {1...80}; }
  done
}

################################################################################
# Spy resources
################################################################################
# htop     - watch the process activities.
# iftop    - watch the download and upload speed
# ncdu     - check the disk space usage
# tcpdump  - capture datagram
# valgrind - Check memory leak or detect bugs
install htop iftop tcpdump ncdu valgrind

# Show directory hierarchy
install tree

# C/C++ compiler and tools
install pkg-config libtool unzip curl
install autoconf automake cmake make gcc g++

install tmux silversearcher-ag

# Remote login by SSH. P.S. the service will be run automatically after
# finishing installation.
install openssh-server

# Drag files to transfer from windows to linux under xshell
# `sz <filename>` to send file to remote windows host.
# `rz` command to open a dialog to choose your wanted file to transfer same as
# drag file.
install lrzsz

# Deploy python3 environment
python_ver="3.6"
install "python${python_ver}" python3-pip
linked_python=$(python --version | grep ${python_ver})
if [ -z "$linked_python" ]; then
  wanted_python_location=$(which "python${python_ver}")
  sudo ln -fs "$wanted_python_location" "/usr/bin/python"
fi
