#!/usr/bin/env bash
# The individual per-interactive-shell startup file

echo "DEBUG::basrc"
####
#
# include system wide bashrc files
#
if [ -e /etc/bash.bashrc ]; then
    echo "DEBUG::source /etc/bash.bashrc"
    # system wide bashrc file
    source /etc/bash.bashrc
fi
if [ -e /etc/bashrc ]; then
    echo "DEBUG::srouce /etc/bashrc"
    # system wide bashrc file
    source /etc/bashrc
fi

####
#
# PATH configuration
# 
# Highest priority at the top, if the directory
# does not exist then it will not be included in
# the PATH env variable
#
PATH_ARRAY=(
    $HOME/bin.local
    $HOME/bin
    $HOME/.composer/vendor/bin
    /usr/loval/heroku/bin
    /opt/local/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/MacGPG2/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
)
PATH=""
for p in ${PATH_ARRAY[*]}; do
    if [ -d $p ]; then
        PATH=$PATH:$p
    fi
done
PATH="${PATH:1:${#PATH}}"
export PATH
#### PATH ####

####
#
# Edit some variables
#
DOTFILES_HOME=$HOME/dotfiles
export EDITOR="vim"
export GIT_EDITOR="vim"
export SVN_EDITOR=vim
export BROWSER=chromium-browser
export IRC_CLIENT="irssi"

# Don't check for mail
unset MAILCHECK

# Put a space before a command to exclude it from the history file
# Pressing up will not store the previous cmd in the history
# Only stores one of any given command
export HISTCONTROL="ignoreboth:erasedups"

# These will be ignored and not place in the HISTFILE
export HISTIGNORE="pwd:clear:exit:history"
#### variables ####

####
#
# Source the bash.local if there is one
#
if [ -f "$HOME/.bash.local" ]; then
    source $HOME/.bash.local
fi
######

# Default functions
if [ -f $DOTFILES_HOME/bash.d/functions ]; then
  source $DOTFILES_HOME/bash.d/functions
fi

# Default completions
if [ -f $DOTFILES_HOME/bash.d/completions ]; then
  source $DOTFILES_HOME/bash.d/completions
fi

# Load some defaults
source $DOTFILES_HOME/lib/colours
source $DOTFILES_HOME/bash.d/config.bash
source $DOTFILES_HOME/bash.d/base.bash

# Default aliases
if [ -f $DOTFILES_HOME/bash.d/aliases ]; then
  source $DOTFILES_HOME/bash.d/aliases
fi
