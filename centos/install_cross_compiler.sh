#!/bin/bash

# Install cross compiler for windows on linux platform.
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install epel-release-latest-7.noarch.rpm

# Install mingw64-gcc, C++, pthread library, included boost static library
sudo yum -y install mingw64-gcc
sudo yum -y install mingw64-gcc-c++
sudo yum -y install mingw64-winpthreads-static
sudo yum -y install mingw64-boost-static

# Install Python36 frome epel repository.
sudo yum -y install python36
