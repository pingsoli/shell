#!/bin/bash

create_if_nonexist()
{
  for dir in "$@"; do
   if [ ! -d "$dir" ]; then
     echo "Creating $dir..."
     mkdir "$dir"
   fi
  done
}

del_dirs()
{
  for dir in "$@"; do
    if [ -d "$dir" ]; then
      echo "Deleting $dir..."
      rm -rf "$dir"
    fi
  done
}

source ./config.sh

config_dir="$MY_HOME/.config"
wanted_dirs=($MY_WORKSPACE $MY_DOWNLOADS $config_dir)

for dir_name in ${wanted_dirs[@]}; do
  create_if_nonexist $dir_name
done

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
