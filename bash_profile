#!/usr/bin/env bash # ~/.bash_profile 
export PATH=$HOME/bin.local:$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:$PATH

if [[ -d /Applications/SenchaSDKTools-2.0.0-beta3 ]]; then
    export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH
    export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
fi

DOTFILES_HOME=$HOME/.dotfiles
export EDITOR="vim"
export GIT_EDITOR="vim"
export SVN_EDITOR=vim
export BROWSER=chromium-browser
export IRC_CLIENT="irssi"
unset MAILCHECK

# Default aliases
alias reload="source $HOME/bash_profile"

# Load some defaults
source $DOTFILES_HOME/bash.d/colors.bash
source $DOTFILES_HOME/bash.d/config.bash
source $DOTFILES_HOME/bash.d/base.bash

# Default functions
if [ -f $DOTFILES_HOME/bash.d/functions ]; then
  source $DOTFILES_HOME/bash.d/functions
fi

# Default aliases
if [ -f $DOTFILES_HOME/bash.d/aliases ]; then
  source $DOTFILES_HOME/bash.d/aliases
fi

# Default completions
if [ -f $DOTFILES_HOME/bash.d/completions ]; then
  source $DOTFILES_HOME/bash.d/completions
fi
