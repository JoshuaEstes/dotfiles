#!/usr/bin/env bash
# vi: set ft=sh :

# @see http://tools.ietf.org/html/rfc5424#appendix-A.3
DOTFILES_LOG_LEVEL=7

# ---- Logging ----
# 7
function log_debug() {
    if [[ $DOTFILES_LOG_LEVEL > 6 ]]; then
        printf "\r[\033[04;34mDEBUG\033[0m] $1\n\r"
    fi
}

# 6
function log_info() {
    if [[ $DOTFILES_LOG_LEVEL > 5 ]]; then
        printf "\r[\033[04;34mINFO\033[0m] $1\n\r"
    fi
}

# 5
function log_notice() {
    if [[ $DOTFILES_LOG_LEVEL > 4 ]]; then
        printf "\r[\033[04;33mNOTICE\033[0m] $1\n\r"
    fi
}

# 4
function log_warning() {
    if [[ $DOTFILES_LOG_LEVEL > 3 ]]; then
        printf "\r[\033[04;33mWARNING\033[0m] $1\n\r"
    fi
}

# 3
function log_error() {
    if [[ $DOTFILES_LOG_LEVEL > 2 ]]; then
        printf "\r[\033[04;31mERROR\033[0m] $1\n\r"
    fi
}

# 2
function log_critical() {
    if [[ $DOTFILES_LOG_LEVEL > 1 ]]; then
        printf "\r[\033[04;31mCRITICAL\033[0m] $1\n\r"
    fi
}

# 1
function log_alert() {
    if [[ $DOTFILES_LOG_LEVEL > 0 ]]; then
        printf "\r[\033[04;31mALERT\033[0m] $1\n\r"
    fi
}

# 0
function log_emergency() {
    if [[ $DOTFILES_LOG_LEVEL > -1 ]]; then
        printf "\r[\033[04;31mEMERGENCY\033[0m] $1\n\r"
    fi
    exit
}
# ---- end logging ----

####
# @param string Question to ask
# @param bool   Default, either 1 or 0
# @return bool
function ask_yes_or_no() {
    local answer

    printf "\r[\033[0;33m?\033[0m] $1 [Y/n]: "
    read -n 1 answer
    echo

    if [[ $answer = [nN] ]]; then
        return 1
    fi

    return 0
}
