#!/bin/bash

# Clean up the APT cache, use the following command to check the apt cache size.
# `sudo du -sh /var/cache/apt`
sudo apt-get clean

# Clean up the old kernels
sudo apt-get -y autoremove --purge
