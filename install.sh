#! /bin/bash

CONFIG_DIR="$HOME/.config"
if [ -d $CONFIG_DIR ]; then
  echo "$CONFIG_DIR already exists"
else
  echo "create config folder"
  mkdir -p $CONFIG_DIR
fi
