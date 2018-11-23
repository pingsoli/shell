#!/bin/bash

git config --global user.email "pingsoli@163.com"
git config --global user.name "pingsoli"

# Remember password and username
git config --global credential.helper store

git config --global core.editor vim

# Avoid garbage characters when showing Chinese.
git config core.quotepath false
