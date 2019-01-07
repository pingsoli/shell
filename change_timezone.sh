#!/bin/bash

# Set timezone
sudo /usr/bin/timedatectl set-timezone "Asia/Shanghai"
# sudo /usr/bin/timedatectl set-timezone UTC

# Synchronize time
sudo /usr/bin/timedatectl set-ntp true
