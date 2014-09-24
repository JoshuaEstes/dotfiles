#!/usr/bin/env bash
####
#
# This file is responsible for loading alias files from different
# places on the systems.
#

if [ ! -d $HOME/.bash.d/aliases.d/available ]; then
  mkdir -p $HOME/.bash.d/aliases.d/available
fi
if [ ! -d $HOME/.bash.d/aliases.d/enabled ]; then
  mkdir -p $HOME/.bash.d/aliases.d/enabled
fi

for FILE in $HOME/.bash.d/aliases.d/enabled/*; do
  if [ -f $FILE ]; then
    source $FILE;
  fi
done
