#!/usr/bin/env zsh
####
#
#
#
_symfony_console() {
    echo "php $(find . -maxdepth 2 -mindepth 1 -name 'console' -type f | head -n 1)"
}

alias sf='`_symfony_console`'
