#!/usr/bin/env zsh
SOURCE="$HOME/.zshrc"
while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DOTFILES_ROOT="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [ $(command -v dircolors) ]; then
    eval "$(dircolors $DOTFILES_ROOT/lib/dircolors/dircolors.ansi-dark)"
fi
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

# Aliases
alias c='composer'
alias d='docker'
alias g='git'
alias h='history'
alias n='npm'
alias ls='ls -G'
alias ll='ls -alh -G'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias mkdir='mkdir -p'
alias reload="source $HOME/.zshrc"
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# Options
setopt always_to_end
setopt append_history
setopt auto_cd
setopt auto_continue
setopt auto_menu
setopt auto_pushd
setopt cdablevars
setopt chase_dots
setopt chase_links
setopt complete_in_word
setopt correct_all
setopt extended_history
unsetopt flowcontrol
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
unsetopt menu_complete
setopt monitor
setopt multios
setopt no_beep
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushdminus
setopt share_history
#setopt verbose
setopt vi

# Variables
HISTSIZE=1000
SAVEHIST=1000

# Prompt
PS1=$'%F{white}%n@%m %F{yellow}%~\n%F{white}$ %{$reset_color%}'
RPS1='%t'
