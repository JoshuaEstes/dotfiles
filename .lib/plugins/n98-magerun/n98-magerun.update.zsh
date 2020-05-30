#!/usr/bin/env zsh
# vi: set ft=zsh:

if [ $(command -v n98-magerun.phar) ]; then
    n98-magerun.phar self-update
fi
