#!/usr/bin/env bash
####
#
# This will install the dotfiles
#
DOTFILES_HOME="$HOME/.dotfiles"

# Install git submodules
git submodule update --init --recursive

# Copy to new directory
rm -rf $DOTFILES_HOME
mkdir -p $DOTFILES_HOME
cp -vR $PWD/* $DOTFILES_HOME/

# Backup files
mv $HOME/.ackrc $HOME/.ackrc~
mv $HOME/.bash_logout $HOME/.bash_logout~
mv $HOME/.bash_profile $HOME/.bash_profile~
mv $HOME/.bashrc $HOME/.bashrc~
mv $HOME/.gemrc $HOME/.gemrc~
mv $HOME/.gitconfig $HOME/.gitconfig~
mv $HOME/.inputrc $HOME/.inputrc~
mv $HOME/.osx $HOME/.osx~
mv $HOME/.tmux.conf $HOME/.tmux.conf~
mv $HOME/.vimrc $HOME/.vimrc~

# Create symlinks
ln -s $DOTFILES_HOME/ackrc $HOME/.ackrc
ln -s $DOTFILES_HOME/bash_logout $HOME/.bash_logout
ln -s $DOTFILES_HOME/bash_profile $HOME/.bash_profile
ln -s $DOTFILES_HOME/bashrc $HOME/.bashrc
ln -s $DOTFILES_HOME/gemrc $HOME/.gemrc
ln -s $DOTFILES_HOME/gitconfig $HOME/.gitconfig
ln -s $DOTFILES_HOME/inputrc $HOME/.inputrc
ln -s $DOTFILES_HOME/osx $HOME/.osx
ln -s $DOTFILES_HOME/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES_HOME/vimrc $HOME/.vimrc

# Reload
. $HOME/.bashrc
