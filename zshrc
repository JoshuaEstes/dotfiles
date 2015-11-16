#!/usr/bin/env zsh
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

PATH_ARRAY=(
    $HOME/bin.local
    $HOME/bin
    $HOME/.composer/vendor/bin
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

# Selectively source scripts
scripts=(misc)
for script ($scripts); do
    if [ -f $DOTFILES_ROOT/lib/scripts/$script.zsh ]; then
        source $DOTFILES_ROOT/lib/scripts/$script.zsh
    fi
done

# Some of the plugins are required for core functionality, others
# can be removed
plugins=(brew cd composer du git history jobs ls mkdir mutt npm phpbrew symfony2 tmux vagrant vim vim-mode vcs)
for plugin ($plugins); do
    if [ -f $DOTFILES_ROOT/lib/plugins/$plugin/$plugin.plugin.zsh ]; then
        fpath=($DOTFILES_ROOT/lib/plugins/$plugin $fpath)
        source $DOTFILES_ROOT/lib/plugins/$plugin/$plugin.plugin.zsh
    fi
done


# Prompt
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PS1='%F{green}[%F{magenta}%n@%m%F{green}][%F{blue}$(phpbrew_current_php_version)%F{green}][%F{cyan}${vcs_info_msg_0_}%F{green}]%F{$reset_color%}
%F{yellow}%~%{$reset_color%} %F{white}%%%F{$reset_color%} '
#RPS1='%F{cyan}${vcs_info_msg_0_}%{$reset_color%}'
RPS1='%{$reset_color%}'
RPS2='%{$reset_color%}'

eval `dircolors $DOTFILES_ROOT/lib/dircolors/dircolors.ansi-dark`
export ZLS_COLORS=$LS_COLORS

clear
uptime
log
from 2>/dev/null
#msgs
