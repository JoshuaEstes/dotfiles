JoshuaEstes/dotfiles
====================

These are my dotfiles. There are many others like it, but this one is mine. My
dotfiles is my best friend. It is my life. I must master it as I must master
my life. Without me, my dotfiles are useless. Without my dotfiles, I am useless.

# Installation

```bash
cd $HOME
git clone git://github.com/JoshuaEstes/dotfiles.git
cd dotfiles
./script/install
```

This will create a ~/.dotfiles directory with the correct files in it.

# Updating

Just run the [up](https://github.com/JoshuaEstes/dotfiles/blob/master/bin/up) command
and it will update based on OS.

```bash
up
```

# Extras

* [Cheat Sheets](https://gist.github.com/JoshuaEstes/2627607)
   * Cheat sheets for bash, tmux, vim, git, etc.

# Configuration

Edit `~/.gitconfig` to your liking

# bin

* `git updatehooks` = Updates the hooks you have in your template directory to the current
                      repository you are working in.
* `up`              = Runs system updates based on what you have installed and the
                      OS that you are running.

# bash

## aliases

See [bash.d/aliases.d/enabled](https://github.com/JoshuaEstes/dotfiles/tree/master/bash.d/aliases.d/enabled) for
a list of aliases that are enabled by default. These dotfiles also source
globally installed alias files.

```
-='cd -'
_='sudo'
c='composer.phar'
cleanup-ds_store='find . -type f -name '\''*.DS_Store'\'' -ls -delete'
cleanup-svn='find . -type d -name '\''*.svn'\'' -ls -delete'
diff='diff -y'
emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'
fake-smtp='python -m smtpd -n -c DebuggingServer localhost:25'
g='git'
ga='git add'
ga.='git add .'
gb='git branch'
gba='git branch -a'
gc='git commit -m'
gca='git commit -am'
gcb='git checkout - b'
gcl='git clone'
gco='git checkout'
gd='git diff'
getcomposer='curl -s https://getcomposer.org/installer | php'
gf='git flow'
gp='git push'
gpl='git pull'
gpo='git push origin'
gr='git remote -v'
gs='git status'
gsa='git stath apply'
gsd='git stash drop'
gsl='git stash list'
gss='git stash'
gt='git tag -n'
h='history'
ip='dig +short myip.opendns.com @resolver1.opendns.com'
j='jobs'
ll='ls -alh'
ls='ls -hFG --color'
mkdir='mkdir -pv'
q='exit'
reload='source ~/.bashrc'
simple-server='php -S 0.0.0.0:8000'
v='vim'
```

# Git

## Hooks
