#!/bin/bash

for FILENAME in $( ls | grep -v README | grep -v install.sh ); do ln -bis "$FILENAME" "$HOME/.$FILENAME"; done
