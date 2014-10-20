#!/usr/bin/env bash
# @see lib/colours

# Still playing around with title bars
case $TERM in
  xterm | xterm-color)
      TITLE_BAR="\[\e]0;\w\a\]"
  ;;
  *)
      TITLE_BAR=""
  ;;
esac

PS1="$TITLE_BAR${white}\u@\h: ${green}\w"

if [[ -n "$PHPBREW_SET_PROMPT" && "$PHPBREW_SET_PROMPT" == "1" ]]; then
    PS1="$PS1 [${bold_red}$(phpbrew_current_php_version)${green}] "
fi

PS1="$PS1${bold_red}\$(__git_ps1 "%s")$white\n\$\[\e[0m\] "
