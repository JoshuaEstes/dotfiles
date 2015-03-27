#!/usr/bin/env bash
#### snippet to figure out where symlink file is located ####
# @see http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DOTFILES_ROOT="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
#### snippet to figure out where symlink file is located ####

# Include global functions to use
source $DOTFILES_ROOT/lib/bash/functions.sh

if [ -e /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
    log_debug '>> source /etc/bash.bashrc'
fi
if [ -e /etc/bashrc ]; then
    source /etc/bashrc
    log_debug '>> source /etc/bashrc'
fi

####
#
# PATH configuration
#
# Highest priority at the top, if the directory
# does not exist then it will not be included in
# the PATH env variable
#
PATH_ARRAY=(
    $HOME/bin.local
    $HOME/bin
    $HOME/.composer/vendor/bin
    $(brew --prefix homebrew/php/php56)/bin
    /usr/local/Cellar/ruby/2.2.0/bin
    /usr/local/heroku/bin
    /opt/local/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/MacGPG2/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/bin
    /bin
    /usr/X11/bin
    /usr/sbin
    /sbin
)
PATH=""
for p in ${PATH_ARRAY[*]}; do
    if [ -d $p ]; then
        PATH=$PATH:$p
    fi
done
PATH="${PATH:1:${#PATH}}"
export PATH
unset PATH_ARRAY
log_debug "PATH => $PATH"
#### end PATH ####

####
#
# Edit some variables
# @TODO Move these to config file
#
export DEBUG=0
export ARCHFLAGS="-arch x86_64"
export EDITOR="vim"
export GIT_EDITOR="vim"
export SVN_EDITOR="vim"
export BROWSER="chromium-browser"
export IRC_CLIENT="irssi"

# Don't check for mail
unset MAILCHECK

# A colon-separated list of values controlling how commands are saved on the
# history list.  If the list of values includes ignorespace, lines  which
# begin  with  a  space character are not saved in the history list.  A value
# of ignoredups causes lines matching the previous history entry to not be
# saved.  A value of ignoreboth is shorthand for ignorespace and ignoredups.  A
# value of erasedups causes all previous lines matching the current line to be
# removed from the history list before that line is  saved.  Any  value  not
# in  the  above list is ignored.  If HISTCONTROL is unset, or does not include
# a valid value, all lines read by the shell parser are saved on the history
# list, subject to the value of HISTIGNORE.  The second and subsequent lines of
# a multi-line compound command are not tested, and are added to the  history
# regardless  of the value of HISTCONTROL.
export HISTCONTROL="ignorespace"
# A  colon-separated  list  of  patterns used to decide which command lines
# should be saved on the history list.  Each pattern is anchored at the
# beginning of the line and must match the complete line (no implicit `*' is
# appended).  Each pattern is tested against the line after the checks
# specified by HISTCONTROL are applied.  In  addition to the normal shell
# pattern matching characters, `&' matches the previous history line.  `&' may
# be escaped using a backslash; the backslash is removed before attempting a
# match.  The second and subsequent lines of a multi-line compound command are
# not tested, and are added to the history regardless of the value of
# HISTIGNORE.
export HISTIGNORE="pwd:clear:exit:history"
# The number of commands to remember in the command history (see HISTORY
# below).  If the value is 0, commands are not saved in the history list.
# Numeric values less  than zero result in every command being saved on the
# history list (there is no limit).  The shell sets the default value to 500
# after reading any startup files.
export HISTSIZE=
# The maximum number of lines contained in the history file.  When this
# variable is assigned a value, the history file is truncated, if necessary, to
# contain no more  than that  number  of lines by removing the oldest entries.
# The history file is also truncated to this size after writing it when a shell
# exits.  If the value is 0, the his- tory file is truncated to zero size.
# Non-numeric values and numeric values less than zero inhibit truncation.  The
# shell sets the default value to the value of HISTSIZE after reading any
# startup files.
export HISTFILESIZE=
# If  this  variable  is set and not null, its value is used as a format string
# for strftime(3) to print the time stamp associated with each history entry
# displayed by the history builtin.  If this variable is set, time stamps are
# written to the history file so they may be preserved across shell sessions.
# This  uses  the  history  comment character to distinguish timestamps from
# other history lines.
export HISTTIMEFORMAT="%Y-%m-%d %H:%M "

####
#
# Source the bash.local if there is one
#
if [ -f "$HOME/.bash.local" ]; then
    source $HOME/.bash.local
    log_debug ">> source $HOME/.bash.local"
fi
#### end bash.local ####

####
#
# Programing Languages - various tools for development, some need there
# own configuration settings or some have settings that provide extra
# features or functionality
#
####
#### php ####
if [ -e $HOME/.phpbrew/bashrc ]; then
    PHPBREW_SET_PROMPT=1
    source $HOME/.phpbrew/bashrc
    log_debug ">> source $HOME/.phpbrew/bashrc"
fi
#### end php ####
#### python ####
export PIP_REQUIRE_VIRTUALENV=false
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
#### end python ####
#### end languages ####

if [ -f /usr/local/opt/autoenv/activate.sh ]; then
    source /usr/local/opt/autoenv/activate.sh
    log_debug '>> source /usr/local/opt/autoenv/activate.sh'
fi

# Default functions
if [ -f $DOTFILES_ROOT/bash.d/functions.bash ]; then
    source $DOTFILES_ROOT/bash.d/functions.bash
    log_debug ">> source $DOTFILES_ROOT/bash.d/functions.bash"
fi

# Default completions
if [ -f $DOTFILES_ROOT/bash.d/completions.bash ]; then
    source $DOTFILES_ROOT/bash.d/completions.bash
    log_debug ">> source $DOTFILES_ROOT/bash.d/completions.bash"
fi

# Default aliases
if [ -f $DOTFILES_ROOT/bash.d/aliases.bash ]; then
    source $DOTFILES_ROOT/bash.d/aliases.bash
    log_debug ">> source $DOTFILES_ROOT/bash.d/aliases.bash"
fi

# Load some defaults
source $DOTFILES_ROOT/lib/colours
log_debug ">> source $DOTFILES_ROOT/lib/colours"
source $DOTFILES_ROOT/bash.d/config.bash
log_debug ">> source $DOTFILES_ROOT/bash.d/config.bash"
source $DOTFILES_ROOT/bash.d/base.bash
log_debug ">> source $DOTFILES_ROOT/bash.d/base.bash"
#### end ####

#### gpg ####
GPG_TTY=$(tty)
export GPG_TTY
if [ -f $HOME/.gpg-agent-info ]; then
    source $HOME/.gpg-agent-info
    log_debug ">> source $HOME/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi
#### end gpg ####
