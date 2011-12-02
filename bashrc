# ~/.bashrc

unset MAILCHECK

UNAME=$(uname)

if [ -f $HOME/.bash.d/aliases ]; then
  source $HOME/.bash.d/aliases
fi
if [ -f $HOME/.bash.d/completions ]; then
  source $HOME/.bash.d/completions
fi
if [ -f $HOME/.bash.d/paths ]; then
  source $HOME/.bash/paths
fi
if [ -f $HOME/.bash.d/config ]; then
  source $HOME/.bash.d/config
fi
if [ -f $HOME/.bash.d/functions ]; then
  source $HOME/.bash.d/functions
fi

# Used for git stuff
parse_git_branch () {
#git name-rev HEAD 2> /dev/null | sed -e 's/\^0$//' | sed 's#HEAD\ \(.*\)#\1#'
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/\^0$//' | sed 's#refs\/heads\/\(.*\)#\1#'
}

BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"

export PS1="$BLACK\u@\h:$GREEN\w $RED_BOLD\$(parse_git_branch)$BLACK \$ "
