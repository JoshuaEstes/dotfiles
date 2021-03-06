#!/usr/bin/env zsh
# vi: set ft=zsh:

#exit

#cd $DOTFILES_ROOT
#git fetch tpm master
#git subtree pull --prefix tmux/plugins/tpm tpm master --squash
# Update all tmux plugins
$DOTFILES_ROOT/tmux/plugins/tpm/bin/update_plugins all

# Remove plugins not on the plugin list
$DOTFILES_ROOT/tmux/plugins/tpm/bin/clean_plugins
