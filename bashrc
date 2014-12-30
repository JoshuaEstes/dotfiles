#!/usr/bin/env bash
# The individual per-interactive-shell startup file

#echo "DEBUG::basrc"
####
#
# include system wide bashrc files
#
if [ -e /etc/bash.bashrc ]; then
    #echo "DEBUG::source /etc/bash.bashrc"
    # system wide bashrc file
    source /etc/bash.bashrc
fi
if [ -e /etc/bashrc ]; then
    #echo "DEBUG::srouce /etc/bashrc"
    # system wide bashrc file
    source /etc/bashrc
fi
#### end system bashrc files ####


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
    $(brew --prefix homebrew/php/php56)/bin
    /usr/local/Cellar/ruby/2.2.0/bin
    /usr/local/heroku/bin
    /opt/local/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/MacGPG2/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/bin
    /bin
    /usr/X11/bin
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
unset PATH_ARRAY
#### end PATH ####

####
#
# Edit some variables
#
DOTFILES_HOME=$HOME/dotfiles
export DEBUG=0
export ARCHFLAGS="-arch x86_64"
export EDITOR="vim"
export GIT_EDITOR="vim"
export SVN_EDITOR="vim"
export BROWSER="chromium-browser"
export IRC_CLIENT="irssi"

# Don't check for mail
unset MAILCHECK

# Put a space before a command to exclude it from the history file
# Pressing up will not store the previous cmd in the history
# Only stores one of any given command
export HISTCONTROL="ignoreboth:erasedups"

# These will be ignored and not place in the HISTFILE
export HISTIGNORE="pwd:clear:exit:history"

####
#
# Source the bash.local if there is one
#
if [ -f "$HOME/.bash.local" ]; then
    source $HOME/.bash.local
fi
#### end bash.local ####

####
#
# Programing Languages - various tools for development, some need there
# own configuration settings or some have settings that provide extra
# features or functionality
#
####
#### php ####
if [ -e $HOME/.phpbrew/bashrc ]; then
    PHPBREW_SET_PROMPT=1
    source $HOME/.phpbrew/bashrc
fi
#### end php ####
#### python ####
export PIP_REQUIRE_VIRTUALENV=false
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
#### end python ####
#### end languages ####

if [ -f /usr/local/opt/autoenv/activate.sh ]; then
    source /usr/local/opt/autoenv/activate.sh
fi

# Default functions
if [ -f $DOTFILES_HOME/bash.d/functions.bash ]; then
  source $DOTFILES_HOME/bash.d/functions.bash
fi

# Default completions
if [ -f $DOTFILES_HOME/bash.d/completions.bash ]; then
  source $DOTFILES_HOME/bash.d/completions.bash
fi

# Default aliases
if [ -f $DOTFILES_HOME/bash.d/aliases.bash ]; then
  source $DOTFILES_HOME/bash.d/aliases.bash
fi

# Load some defaults
source $DOTFILES_HOME/lib/colours
source $DOTFILES_HOME/bash.d/config.bash
source $DOTFILES_HOME/bash.d/base.bash
#### end ####

#### gpg ####
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
    source "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi
#### end gpg ####
