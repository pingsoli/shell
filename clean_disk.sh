#!/bin/bash

# Uninstall unnecessary programs
# sudo apt remove <application-name>
# sudo apt purge <package-name>

# Clean up the APT cache, use the following command to check the apt cache size.
# `sudo du -sh /var/cache/apt`
sudo apt-get clean
sudo apt-get autoclean

# Clean up the old kernels
sudo apt-get -y autoremove --purge
