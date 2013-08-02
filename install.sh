#!/usr/bin/env bash
####
#
# This will install the dotfiles into ~/.dotfiles directory
# which will allow us to blow away that directory to install
# updated code
#

# Location where the dotfiles will live
DOTFILES_HOME="$HOME/.dotfiles"

####
# Backup a dotfile
#
# Usage: backup_dotfile "bashrc"
#
# @param string $1 Filename to backup
#
function backup_dotfile()
{
    if [ -z "$1" ]; then
        echo "You must pass a filename to this function"
        return 1
    fi

    if [ -f "$HOME/.$1" ]; then
        echo "DEBUG::mv $HOME/.$1 $HOME/.$1~"
        mv -v $HOME/.$1 $HOME/.$1~
        return 0;
    fi

    if [ -d "$HOME/.$1" ]; then
        echo "DEBUG::mv $HOME/.$1 $HOME/.$1~"
        mv -v $HOME/.$1 $HOME/.$1~
        return 0
    fi

    echo "DEBUG::backup::$HOME/.$1 not found"

    return 0
}

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

    echo "DEBUG::ln -s $DOTFILES_HOME/$1 $HOME/.$1"
    ln -s $DOTFILES_HOME/$1 $HOME/.$1
}

# Install git submodules
git submodule update --init --recursive

# Copy to new directory
if [ -d $DOTFILES_HOME ]; then
    echo "DEBUG::rm -rf $DOTFILES_HOME"
    rm -rf $DOTFILES_HOME
fi

echo "DEBUG::mkdir -p $DOTFILES_HOME"
mkdir -p $DOTFILES_HOME

echo "DEBUG::cp -vR $PWD/* $DOTFILES_HOME/"
cp -R $PWD/* $DOTFILES_HOME/

# Backup files
backup_dotfile "ackrc"
backup_dotfile "bash_logout"
backup_dotfile "bash_profile"
backup_dotfile "bashrc"
backup_dotfile "gemrc"
backup_dotfile "gitconfig"
backup_dotfile "inputrc"
if [ "$(uname)" == "Darwin" ]; then
    backup_dotfile "osx"
fi
backup_dotfile "tmux.conf"
backup_dotfile "vimrc"
backup_dotfile "zlogin"
backup_dotfile "zlogout"
backup_dotfile "zprofile"
backup_dotfile "zshenv"
backup_dotfile "zshrc"
backup_dotfile "vim"
backup_dotfile "bash.d"
backup_dotfile "gitconfig.d"
backup_dotfile "zsh.d"

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
symlink_dotfile "vim"
symlink_dotfile "bash.d"
symlink_dotfile "gitconfig.d"
symlink_dotfile "zsh.d"

# Reload
echo "DEBUG::source $HOME/.bashrc"
. $HOME/.bashrc
