#!/usr/bin/env bash
if [ ! -d $HOME/.bash.d/functions.d/available ]; then
    mkdir -p $HOME/.bash.d/functions.d/available
    log_debug ">> mkdir -p $HOME/.bash.d/functions.d/available"
fi
if [ ! -d $HOME/.bash.d/functions.d/enabled ]; then
    mkdir -p $HOME/.bash.d/functions.d/enabled
    log_debug ">> mkdir -p $HOME/.bash.d/functions.d/enabled"
fi
for FILE in $HOME/.bash.d/functions.d/enabled/*; do
    source $FILE
    log_debug ">> source $FILE"
done
