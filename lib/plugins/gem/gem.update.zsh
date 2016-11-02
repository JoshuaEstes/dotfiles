#!/usr/bin/env zsh
# vi: set ft=zsh:
if [ $(command -v gem) ]; then
    gem update --system -N
    gem update -N
    gem cleanup
fi
