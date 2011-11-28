#!/bin/bash

for FILENAME in $( ls | grep -v README ); do ln -bis "$FILENAME" "$HOME/.$FILENAME"; done
