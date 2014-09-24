#!/usr/bin/env bash

# extended pattern matching
shopt -s extglob

# Check and correct spelling of directories
shopt -s cdspell
if [ "$BASH_VERSINFO" -gt "3" ]; then
    shopt -s dirspell
fi

# multiline commands are saved as one line in history file
shopt -s cmdhist

# append commands to the HISTFILE
shopt -s histappend

# try to preform hostname completion
shopt -s hostcomplete
