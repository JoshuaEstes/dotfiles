#!/usr/bin/env zsh
# vi: set ft=zsh:

####
#
# executes third if shell is interactive
#
autoload -U colors && colors
SOURCE="$HOME/.zshrc"
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DOTFILES_ROOT="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Used to load all the functions that are used
for directory in $(ls $DOTFILES_ROOT/lib/zsh/functions); do
    if [ -d $DOTFILES_ROOT/lib/zsh/functions/${directory} ]; then
        fpath=($DOTFILES_ROOT/lib/zsh/functions/${directory}/ $fpath)
        autoload -U $directory
    fi
done

####
#
# Highest priority is top of list
#
PATH_ARRAY=(
    $HOME/bin.local
    $HOME/bin
    $HOME/.composer/vendor/bin
    $HOME/.chefdk/gem/ruby/2.1.0/bin
    $HOME/Library/Python/3.6/bin
    /usr/local/Cellar/ruby/2.2.0/bin
    /usr/local/heroku/bin
    /opt/local/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/MacGPG2/bin
    /usr/local/opt/ruby/bin
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/opt/icu4c/bin
    /usr/local/opt/icu4c/sbin
    /usr/local/opt/gettext/bin
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

# Selectively source scripts
scripts=(misc)
for script ($scripts); do
    if [ -f $DOTFILES_ROOT/lib/scripts/$script.zsh ]; then
        source $DOTFILES_ROOT/lib/scripts/$script.zsh
    fi
done

# Some of the plugins are required for core functionality, others
# can be removed
source $DOTFILES_ROOT/plugins.zsh
for plugin ($plugins); do
    if [ -f $DOTFILES_ROOT/lib/plugins/$plugin/$plugin.plugin.zsh ]; then
        fpath=($DOTFILES_ROOT/lib/plugins/$plugin $fpath)
        source $DOTFILES_ROOT/lib/plugins/$plugin/$plugin.plugin.zsh
    fi
done

# Prompt
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PS1='%f%k%F{magenta}%n%F{grey}@%F{yellow}%M %F{green}[%F{blue}$(phpbrew_current_php_version)%F{green}][%F{cyan}${vcs_info_msg_0_}%F{green}]%f%k
%F{green}%~%f%k %F{grey}%#%f%k '
RPS1='%f%k'
RPS2='%f%k'

eval `dircolors $DOTFILES_ROOT/lib/dircolors/dircolors.ansi-dark`
export ZLS_COLORS=$LS_COLORS

clear
#uptime
#log
#from 2>/dev/null
#msgs
