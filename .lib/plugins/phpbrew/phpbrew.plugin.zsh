#!/usr/bin/env zsh
####
#
#
#
if [ -f $HOME/.phpbrew/bashrc ]; then
    PHPBREW_SET_PROMPT=1
    [[ -e $HOME/.phpbrew/bashrc ]] && source $HOME/.phpbrew/bashrc
fi
