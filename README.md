JoshuaEstes/dotfiles
====================

These are my dotfiles. There are many others like it, but this one is mine. My
dotfiles is my best friend. It is my life. I must master it as I must master
my life. Without me, my dotfiles are useless. Without my dotfiles, I am useless.

# Installation

```bash
cd $HOME
git clone git://github.com/JoshuaEstes/dotfiles.git .dotfiles
cd .dotfiles
./script/install
```

NOTE: These files MUST be installed into this directory, if files are not stored
in this director, some parts my not work correctly. This library is installed by
symlinking files to the corresponding dotfile. For example, `$HOME/.bashrc` is
symlinked to `$HOME/.dotfiles/bashrc`.

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

* `up` - Runs system updates based on what you have installed and the
OS that you are running.

# bash

# Git
## Configuration

This project features various hooks that will lint check and run code analysis
on a code base. These can be globally or locally configured. Please see the
hooks section for more information.

## Commands

* `git updatehooks` - Updates the hooks you have in your template directory to the current
repository you are working in.

## Hooks

As previously stated, hooks exist to run code analysis tools. These can be used
to block a commit if they do not meet various coding standards.

### phpcs
### phpmd

# Email

Mutt is used for email along with `ppl` for the address book part in which
contact information is store. The address book is configured to keep files in
`$HOME/.AddressBook` directory.

Mailboxes are stored in `$HOME/Mail` and this project does support multiple
accounts.

offlineimap is used to sync mail from servers. You do not need to be connected
to the internet to read email, however you must be connected to sync email.

msmtp is used to send emails.

## Security

GnuPG is used to store credentials and these credentials are stored in
`$HOME/.pw` and can be setup to be a git repository.
