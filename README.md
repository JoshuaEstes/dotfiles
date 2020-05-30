JoshuaEstes/dotfiles
====================

These are my dotfiles. There are many others like it, but this one is mine. My
dotfiles is my best friend. It is my life. I must master it as I must master
my life. Without me, my dotfiles are useless. Without my dotfiles, I am useless.

# Setup

```
# initial setup
git init --bare $HOME/.dotfiles

# the -C allows us act like we ran git in that path
# This alias MUST go in your shell rc files
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME -C $HOME'

dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:JoshuaEstes/dotfiles.git
```

```
# on a new computer
git clone --bare git@github.com:JoshuaEstes/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
