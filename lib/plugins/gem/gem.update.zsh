#!/usr/bin/env zsh
# vi: set ft=zsh:
if [ $(command -v gem) ]; then
    gem update --system
    gem update
    gem cleanup
fi
