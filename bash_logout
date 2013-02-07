# ~/.bash_logout
# The individual login shell cleanup file, executed when a login shell exits

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# Remove history
history -c
clear
