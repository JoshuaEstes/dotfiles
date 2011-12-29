# ~/.bash_logout

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# Remove history
if [ -f $HOME/.bash_history ]; then
  rm $HOME/.bash_history; touch $HOME/.bash_history
fi
