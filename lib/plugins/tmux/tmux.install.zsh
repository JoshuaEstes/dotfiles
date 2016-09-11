#!/usr/bin/env zsh
# vi: set ft=zsh:


# Install TPM
# @see https://github.com/tmux-plugins/tpm/blob/master/docs/automatic_tpm_installation.md
git clone https://github.com/tmux-plugins/tpm $DOTFILES_ROOT/tmux/plugins/tpm

# Install TPM plugins
# @seehttps://github.com/tmux-plugins/tpm/blob/master/docs/managing_plugins_via_cmd_line.md
$DOTFILES_ROOT/tmux/plugins/tpm/bin/install_plugins

# Install tmux here
