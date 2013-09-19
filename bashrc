#!/usr/bin/env bash
# The individual per-interactive-shell startup file

echo "DEBUG::basrc"
if [ -e /etc/bash.bashrc ]; then
    # system wide bashrc file
    source /etc/bash.bashrc
fi
if [ -e /etc/bashrc ]; then
    # system wide bashrc file
    source /etc/bashrc
fi

####
#
# PATH configuration
#
export PATH=$HOME/bin.local:$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH
if [ -d /Applications/SenchaSDKTools-2.0.0-beta3 ]; then
    export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH
    export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
fi
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
export HISTCONTROL="ignorespace"
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
source $DOTFILES_HOME/bash.d/colors.bash
source $DOTFILES_HOME/bash.d/config.bash
source $DOTFILES_HOME/bash.d/base.bash

# Default aliases
if [ -f $DOTFILES_HOME/bash.d/aliases ]; then
  source $DOTFILES_HOME/bash.d/aliases
fi

