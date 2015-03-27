#!/usr/bin/env bash
if [ ! -d $HOME/.bash.d/aliases.d/available ]; then
    mkdir -p $HOME/.bash.d/aliases.d/available
    log_debug ">> mkdir -p $HOME/.bash.d/aliases.d/available"
fi
if [ ! -d $HOME/.bash.d/aliases.d/enabled ]; then
    mkdir -p $HOME/.bash.d/aliases.d/enabled
    log_debug ">> mkdir -p $HOME/.bash.d/aliases.d/enabled"
fi
for FILE in $HOME/.bash.d/aliases.d/enabled/*; do
    source $FILE
    log_debug ">> source $FILE"
done
