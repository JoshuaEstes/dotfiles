#!/usr/bin/env zsh
####
#
# VCS Plugin
#
autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true
zstyle ':vcs_info:git+*:*' debug false
zstyle ':vcs_info:git:*' formats '(%b [%c])'
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
        hook_com[staged]='dirty'
    fi
}
