#!/usr/bin/env zsh
####
#
#
#

# Completions
if [ $(command -v brew) ]; then
    ln -fs "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions
fi
