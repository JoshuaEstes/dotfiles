#!/usr/bin/env bash
####
#
# This will install the dotfiles into ~/.dotfiles directory
# which will allow us to blow away that directory to install
# updated code
#

# Location where the dotfiles will live
DOTFILES_HOME="$HOME/dotfiles"

####
# Symlink a dotfile from the ~/.dotfiles directory to where
# it needs to go in the home directory
#
# Usage: symlink "bashrc"
#
# @param string $1 Filename to symlink
#
function symlink_dotfile()
{
    if [ -z "$1" ]; then
        echo "You must pass a filename to this function"
        return 1
    fi

    ln -hFvs $DOTFILES_HOME/$1 $HOME/.$1
}

# Install git submodules
git submodule update --init --recursive

vim +PluginInstall +qall
cd vim/bundle/YouCompleteMe
./install.sh
cd -

# Create symlinks
symlink_dotfile "ackrc"
symlink_dotfile "bash_logout"
symlink_dotfile "bash_profile"
symlink_dotfile "bashrc"
symlink_dotfile "gemrc"
symlink_dotfile "gitconfig"
symlink_dotfile "inputrc"
if [ "$(uname)" == "Darwin" ]; then
    symlink_dotfile "osx"
fi
symlink_dotfile "tmux.conf"
symlink_dotfile "vimrc"
symlink_dotfile "zlogin"
symlink_dotfile "zlogout"
symlink_dotfile "zprofile"
symlink_dotfile "zshenv"
symlink_dotfile "zshrc"
symlink_dotfile "bash.d"
mkdir $HOME/.composer
symlink_dotfile "composer/composer.json"
symlink_dotfile "gitconfig.d"
symlink_dotfile "mutt"
symlink_dotfile "vim"
symlink_dotfile "zsh.d"

if [ $(command -v php) ]; then
    PHP_BIN=$(command -v php)
    # PHP is installed. Install composer and
    # install some apps
    if [ -f $HOME/bin/composer.phar ]; then
        $PHP_BIN $HOME/bin/composer.phar selfupdate
    else
        curl -sS https://getcomposer.org/installer | $PHP_BIN -- --install-dir=$HOME/bin
    fi
    $PHP_BIN $HOME/bin/composer.phar global update
fi

# Reload
echo "DEBUG::source $HOME/.bashrc"
. $HOME/.bashrc
