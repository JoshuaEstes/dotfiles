#!/usr/bin/env zsh
# vi: set ft=zsh:
if [ $(command -v heroku) ]; then
    heroku update
fi
