#!/usr/bin/env zsh
# vi: set ft=zsh:

# Options (man zshoptions)
## Completion
setopt always_to_end
setopt auto_menu
setopt complete_in_word
unsetopt menu_complete
## Expansion and Globbing
setopt multibyte
## History
## Initialisation
## Input/Output
setopt correct
setopt correct_all
unsetopt flowcontrol
## Job Control
## Prompting
setopt prompt_subst
## Scripts and Functions
setopt c_bases
setopt multios
#setopt verbose
#setopt xtrace
## Shell Emulation
## Shell State
## Zle
setopt no_beep


# Clear the screen
alias cl="clear"

# Specific for platform
if [[ "$(uname)" == "Linux" ]]; then
    alias ls="ls -hF --color"
    alias apt-get="sudo apt-get"
else
    # Should be Darwin
    alias ls="ls -hFG"
    if [ $(command -v dircolors) ]; then
        alias ls="ls -hFG --color"
    fi
    alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
fi

alias _="sudo"
alias q="exit"
alias diff="diff -y"

# Show your IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Remove those pesky .DS_STORE files
alias cleanup-ds_store="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanup-svn="find . -type d -name '*.svn' -ls -delete"

# spin up a php server in the current directory
alias simple-server="php -S 0.0.0.0:8000"

# Shortcut for composer.phar install
alias getcomposer="curl -s https://getcomposer.org/installer | php"

# Python Oneliners
# http://www.vurt.ru/2013/02/python-command-line-oneliners/
alias fake-smtp="python -m smtpd -n -c DebuggingServer localhost:25"
