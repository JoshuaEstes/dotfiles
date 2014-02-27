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
export PATH=$HOME/bin.local:$HOME/bin:/usr/local/bin:/opt/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/sbin
#### PATH ####

####
#
# Edit some variables
#
DOTFILES_HOME=$HOME/.dotfiles

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

# Load some default files
source $DOTFILES_HOME/bash.d/functions.bash
source $DOTFILES_HOME/bash.d/completions.bash
source $DOTFILES_HOME/bash.d/colors.bash
source $DOTFILES_HOME/bash.d/config.bash
source $DOTFILES_HOME/bash.d/base.bash
source $DOTFILES_HOME/bash.d/aliases.bash
