#!/usr/bin/env zsh
# vi: set ft=zsh:
brew update
brew upgrade --all
brew linkapps
brew cleanup
brew prune
