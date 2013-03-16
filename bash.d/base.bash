#!/usr/bin/env bash

# Still playing around with title bars
case $TERM in
  xterm | xterm-color)
      TITLE_BAR="\[\e]0;\w\a\]"
  ;;
  *)
      TITLE_BAR=""
  ;;
esac

# Display the title bar and the prompt
PS1="$TITLE_BAR${white}\u@\h: ${green}\w${bold_red} \$(__git_ps1 "%s")$white\n\$${white} "
