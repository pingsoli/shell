#!/bin/bash

source ./config.sh

create_if_nonexist()
{
  for dir in "$@"; do
   if [ ! -d "$dir" ]; then
     mkdir "$dir"
   fi
  done
}

create_if_nonexist "$MY_WORKSPACE" "$MY_DOWNLOADS"

del_dirs()
{
  for dir in "$@"; do
    rm -rf "$dir"
  done
}

documents="$MY_HOME/Documents"
downloads="$MY_HOME/Downloads"
music="$MY_HOME/Music"
pictures="$MY_HOME/Pictures"
public="$MY_HOME/Public"
templates="$MY_HOME/Templates"
videos="$MY_HOME/Videos"

unnecessary_dirs=($documents $downloads $music $pictures $public $templates $videos)

for dir_name in ${unnecessary_dirs[@]}; do
  # create_if_nonexist $dir_name
  del_dirs $dir_name
done
