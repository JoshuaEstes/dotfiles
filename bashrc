# ~/.bashrc
if [ -f ~/.bash/aliases ]; then
  source ~/.bash/aliases
fi
if [ -e ~/.bash/completions/symfony2 ]; then
  . ~/.bash/completions/symfony2
fi
if [ -f ~/.bash/paths ]; then
  source ~/.bash/paths
fi
if [ -f ~/.bash/config ]; then
  source ~/.bash/config
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
