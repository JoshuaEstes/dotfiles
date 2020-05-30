#!/usr/bin/env zsh
# vi: set ft=zsh:

# Might be worth updating this to subtree instead
git submodule foreach git pull origin master
vim +PluginUpdate +qall
