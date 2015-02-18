#!/usr/bin/env bash
####
#
# General aliases are aliases that are not specific to any one app
#

# Reload bashrc file
alias reload="source ~/.bashrc && bind -f ~/.inputrc"

# Clear the screen
alias cl="clear"

# Specific for platform
if [ $(uname) == "Linux" ]; then
    alias ls="ls -hF --color"
    alias apt-get="sudo apt-get"
else
    # Should be Darwin
    alias ls="ls -hFG"
    #alias ls="ls -hFG --color"
    alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"
fi

alias _="sudo"
alias q="exit"
alias -- -="cd -"
alias h="history"
alias v="vim"
alias c="composer.phar"
alias ll="ls -alh"
alias diff="diff -y"
alias j="jobs"
alias mkdir="mkdir -pv"

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

# Aliases for node and npm
alias n="npm"
