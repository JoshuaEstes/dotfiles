#!/usr/bin/env bash

# If there is a default file, then load that one first
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# make sure our directories exist first
if [ ! -d $HOME/.bash.d/completions.d/available ]; then
  mkdir -p $HOME/.bash.d/completions.d/available
fi
if [ ! -d $HOME/.bash.d/completions.d/enabled ]; then
  mkdir -p $HOME/.bash.d/completions.d/enabled
fi

# All the completion scripts that are enabled will get sourced
for FILE in $HOME/.bash.d/completions.d/enabled/*; do
  if [ -f $FILE ]; then
    source $FILE;
  fi
done

# This is for when you are trying to ssh into a server, you can use autocompelete,
# which will check your bash_history file and try to use that, very useful if you
# ssh into a lot of different machines =)
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh
