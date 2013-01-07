#!/usr/bin/env bash

# Still playing around with title bars
case $TERM in
  xterm | xterm-color)
    TITLE_BAR="\[\e]0;\w\a\]"
  ;;
esac

# Display the title bar and the prompt
PS1="\[\033[G\]$TITLE_BAR\[$white\]\u@\h: \[$green\]\w\[$red\] \$(__git_ps1 "%s")\[$white\]\n\$ ${reset_color}"
