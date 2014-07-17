#!/usr/bin/env bash

# Default aliases
alias reload="source $HOME/.bashrc"

# make sure our directories exist first
if [ ! -d $HOME/.bash.d/aliases.d/available ]; then
  mkdir -p $HOME/.bash.d/aliases.d/available
fi
if [ ! -d $HOME/.bash.d/aliases.d/enabled ]; then
  mkdir -p $HOME/.bash.d/aliases.d/enabled
fi

# Load all the aliases in the enabled folder
for FILE in $HOME/.bash.d/aliases.d/enabled/*; do
  if [ -f $FILE ]; then
    #echo "Sourcing $FILE"
    source $FILE;
  fi
done
