#!/usr/bin/env zsh
# vi: set ft=zsh:

if [ $(command -v composer) ]; then
    composer selfupdate
    composer global update
fi
