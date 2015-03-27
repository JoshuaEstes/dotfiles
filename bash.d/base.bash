#!/usr/bin/env bash

case $TERM in
  xterm* | screen*)
      TITLE_BAR="\[\033]0;\u@\h:\w\a\]"
  ;;
  *)
      TITLE_BAR=""
  ;;
esac

PS1="${TITLE_BAR}\033[1;37m\u@\h \033[0;33m\w"

if [[ -n "$PHPBREW_SET_PROMPT" && "$PHPBREW_SET_PROMPT" == "1" ]]; then
    PS1="$PS1 \033[0;32m[\033[0;34m\$(phpbrew_current_php_version)\033[0;32m]"
fi

PS1="$PS1 \033[0;35m\$(__git_ps1 "%s")\033[1;37m\n\$\[\033[0m "
