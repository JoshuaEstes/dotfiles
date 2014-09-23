#!/usr/bin/env bash

# make sure our directories exist
if [ ! -d $HOME/.bash.d/functions.d/available ]; then
  mkdir -p $HOME/.bash.d/functions.d/available
fi
if [ ! -d $HOME/.bash.d/functions.d/enabled ]; then
  mkdir -p $HOME/.bash.d/functions.d/enabled
fi
for FILE in $HOME/.bash.d/functions.d/enabled/*; do
  if [ -f $FILE ]; then
    source $FILE;
  fi
done