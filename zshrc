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

# Aliases
alias -- -='cd -'
alias c='composer'
alias d='docker'
# Sometimes zsh tries to correct some of my git aliases
alias g='nocorrect git'
alias gd='git diff'
alias gs='git status'
alias gr='git remote -v'
alias n='npm'

# System Related Aliases
alias h='history'
alias j='jobs'
alias mkdir='mkdir -vp'
alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -alh'
alias la='ls -a'
alias lsa='ls -lsd .*' # List ONLY hidden files/directories
alias lsd='ls -ld *(-/DN)' # List ONLY Directories, includes hidden directories
alias du1='du -hs *(/)' # List disk usage for all directories in $PWD

# To be used with taskwarrior
# Usage:
# ```
# tickle monday Takeout trash
# tickle 2099-12-31 End of the world
# ```
function tickle() {
    local deadline=$1
    shift
    task add +in +tickle wait:$deadline $@
}

function read_and_review() {
    local link="$1"
    local title=$(wget -qO- "$link" | hxselect -s '\n' -c  'title' 2>/dev/null)
    echo $title
    local descr="\"Read and review: $title\""
    local id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}

# Task Warrior Aliases
alias t='task'
alias in='task add +in'
alias think='tickle +1d' # Think it over for one day
alias rnd='task add +rnd' # Research and Development
alias rnr=read_and_review # Read and Review

# Mutt Aliases
alias m='mutt'

# Vagrant Aliases
alias vs='vagrant status'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vssh='vagrant ssh --'

# Vim Aliases
alias v='vim'
alias vi='vim'

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

# git
# get the name of the branch we are on
function git_prompt_info() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "(${ref#refs/heads/} $(parse_git_dirty))"
  fi
}


# Checks if working tree is dirty
parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "[dirty]"
  else
    echo "[clean]"
  fi
}

# get the difference between the local and remote branches
git_remote_status() {
    remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [ $ahead -eq 0 ] && [ $behind -gt 0 ]
        then
            echo "behind remote"
        elif [ $ahead -gt 0 ] && [ $behind -eq 0 ]
        then
            echo "ahead of remote"
        elif [ $ahead -gt 0 ] && [ $behind -gt 0 ]
        then
            echo "diverged"
        fi
    fi
}

# Checks if there are commits ahead from remote
function git_prompt_ahead() {
  if $(echo "$(command git log @{upstream}..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "ahead"
  fi
}

# Gets the number of commits ahead from remote
function git_commits_ahead() {
  if $(echo "$(command git log @{upstream}..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    COMMITS=$(command git log @{upstream}..HEAD | grep '^commit' | wc -l | tr -d ' ')
    echo "ahead $COMMITS commits"
  fi
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  SHA=$(command git rev-parse --short HEAD 2> /dev/null) && echo "$SHA"
}

# Formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
  SHA=$(command git rev-parse HEAD 2> /dev/null) && echo "$SHA"
}

# Get the status of the working tree
git_prompt_status() {
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*diverged' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  fi
  echo $STATUS
}

#compare the provided version of git to the version installed and on path
#prints 1 if input version <= installed version
#prints -1 otherwise
function git_compare_version() {
  local INPUT_GIT_VERSION=$1;
  local INSTALLED_GIT_VERSION
  INPUT_GIT_VERSION=(${(s/./)INPUT_GIT_VERSION});
  INSTALLED_GIT_VERSION=($(command git --version 2>/dev/null));
  INSTALLED_GIT_VERSION=(${(s/./)INSTALLED_GIT_VERSION[3]});

  for i in {1..3}; do
    if [[ $INSTALLED_GIT_VERSION[$i] -gt $INPUT_GIT_VERSION[$i] ]]; then
      echo 1
      return 0
    fi
    if [[ $INSTALLED_GIT_VERSION[$i] -lt $INPUT_GIT_VERSION[$i] ]]; then
      echo -1
      return 0
    fi
  done
  echo 0
}

#this is unlikely to change so make it all statically assigned
POST_1_7_2_GIT=$(git_compare_version "1.7.2")
#clean up the namespace slightly by removing the checker function
unset -f git_compare_version
# end git

# Prompt
source $HOME/.phpbrew/bashrc
PS1=$'%F{green}[%F{magenta}%n@%m%F{green}] %F{green}[%F{cyan}inbox $(task +in +PENDING count)%F{green}] %F{green}[%F{blue}$(phpbrew_current_php_version)%F{green}] %F{cyan}$(git_prompt_info)
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
