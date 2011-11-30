#!/bin/bash

for FILENAME in $( ls | grep -v README | grep -v install.sh | grep -v web_install.sh ); do echo "installing $FILENAME"; ln -bis "$(pwd)/$FILENAME" "$HOME/.$FILENAME"; done


