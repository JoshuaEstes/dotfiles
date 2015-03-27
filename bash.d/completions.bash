#!/usr/bin/env bash

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
    log_debug ">> source /etc/bash_completion"
fi

#if [ -f /usr/local/etc/bash_completion ]; then
#    source /usr/local/etc/bash_completion
#fi

#if [ -d "/usr/local/etc/bash_completion.d" ]; then
#    for FILE in /usr/local/etc/bash_completion.d/*; do
#        source $FILE
#    done
#fi

# If brew is installed
#if [ $(command -v brew) ]; then
#    if [ -f $(brew --prefix)/etc/bash_completion ]; then
#        source $(brew --prefix)/etc/bash_completion
#    fi
#fi

# make sure our directories exist first
if [ ! -d $HOME/.bash.d/completions.d/available ]; then
    mkdir -p $HOME/.bash.d/completions.d/available
    log_debug ">> mkdir -p $HOME/.bash.d/completions.d/available"
fi
if [ ! -d $HOME/.bash.d/completions.d/enabled ]; then
    mkdir -p $HOME/.bash.d/completions.d/enabled
    log_debug ">> mkdir -p $HOME/.bash.d/completions.d/enabled"
fi

# All the completion scripts that are enabled will get sourced
for FILE in $HOME/.bash.d/completions.d/enabled/*; do
    source $FILE
    log_debug ">> source $FILE"
done

# This is for when you are trying to ssh into a server, you can use autocompelete,
# which will check your bash_history file and try to use that, very useful if you
# ssh into a lot of different machines =)
complete -W "$(echo $(grep '^ssh ' $HOME/.bash_history | sort -u | sed 's/^ssh //'))" ssh
