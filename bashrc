if [ -f ~/.bash/aliases ]; then
  source ~/.bash/aliases
fi
if [ -f ~/.bash/completions ]; then
  source ~/.bash/completions
fi
if [ -f ~/.bash/paths ]; then
  source ~/.bash/paths
fi
if [ -f ~/.bash/config ]; then
  source ~/.bash/config
fi

parse_git_branch () {
  git name-rev HEAD 2> /dev/null | sed -e 's/\^0$//' | sed 's#HEAD\ \(.*\)#\1#'
}

BLACK="\[\033[0;38m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"

export PS1="$BLACK\u@\h:$GREEN\w $RED_BOLD\$(parse_git_branch)$BLACK \$ "
