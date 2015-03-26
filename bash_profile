#!/usr/bin/env bash
# The personal initialization file, executed for login shells ie, non interactive

#echo "DEBUG::bash_profile"
if [ -f $HOME/.bashrc ]; then . $HOME/.bashrc; fi

export NVM_DIR="/Users/joshuaestes/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
