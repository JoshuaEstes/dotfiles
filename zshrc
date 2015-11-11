#!/usr/bin/env zsh
####
#
# executes third if shell is interactive
#
bindkey -v # Use vim key bindings
SOURCE="$HOME/.zshrc"
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DOTFILES_ROOT="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
fpath=($DOTFILES_ROOT/lib/zsh "${fpath[@]}")
autoload -U ${fpath[1]}/*(:t)

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

plugins=(cd composer docker du git history jobs ls mkdir mutt npm phpbrew symfony2 taskwarrior tmux vagrant vim)
for plugin ($plugins); do
    if [ -f $DOTFILES_ROOT/lib/shell/plugins/$plugin/$plugin.plugin.zsh ]; then
        source $DOTFILES_ROOT/lib/shell/plugins/$plugin/$plugin.plugin.zsh
    fi
done

# Options (man zshoptions)
## Changing Directories
setopt auto_cd
setopt auto_pushd
setopt cdablevars
setopt chase_dots
setopt chase_links
setopt pushd_ignore_dups
setopt pushd_minus
## Completion
setopt always_to_end
setopt auto_menu
setopt complete_in_word
unsetopt menu_complete
## Expansion and Globbing
setopt multibyte
## History
setopt append_history
setopt extended_history
#setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
#setopt share_history
## Initialisation
## Input/Output
setopt correct
setopt correct_all
unsetopt flowcontrol
## Job Control
setopt auto_continue
setopt hup
setopt long_list_jobs
setopt monitor
setopt no_check_jobs
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
setopt vi # use bindkey -v instead


# Prompt
PS1=$'%F{green}[%F{magenta}%n@%m%F{green}] %F{green}[%F{blue}$(phpbrew_current_php_version)%F{green}] %F{cyan}$(git_prompt_info)
%F{yellow}%~%{$reset_color%} %F{white}%%%F{$reset_color} '
RPS1='%F{yellow}%~%{$reset_color%}'

autoload -U colors && colors
eval `dircolors $DOTFILES_ROOT/lib/dircolors/dircolors.ansi-dark`
export ZLS_COLORS=$LS_COLORS

clear
uptime
log
from 2>/dev/null
msgs
