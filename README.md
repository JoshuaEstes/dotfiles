JoshuaEstes/dotfiles
====================

These are my dotfiles. There are many others like them, but these are mine. My
dotfiles are my best friend. They are my life. I must master them as I must
master my life. Without me, my dotfiles are useless. Without my dotfiles, I am
useless.

This repository is an example of what a repository would look like if you were
using [PMS](https://github.com/JoshuaEstes/pms) to manage your dotfiles.

# Pimp My Shell (PMS)

[PMS](https://github.com/JoshuaEstes/pms) is a framework for managing your
shell. It provides themes, plugins, and a simple way to keep your dotfiles in
sync across machines.

## Installation

```sh
export PMS="$HOME/.pms"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/JoshuaEstes/pms/main/scripts/install.sh)"
echo 'export PMS="$HOME/.pms"' >> "$HOME/.zshenv"
```

The `PMS` environment variable must point to the PMS installation directory. If
desired, set `PMS_SHELL` to select the shell that PMS should configure.

# Plugin Managers

## Vundle

```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Launch Vim and run `:PluginInstall` to install configured plugins.

## TPM (Tmux Plugin Manager)

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Inside tmux, press `prefix` + `I` to install plugins.

# Bootstrapping

## Initial setup

```sh
git init --bare "$HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME -C $HOME'

# The -C flag allows us to act as though we ran git in that path
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:JoshuaEstes/dotfiles.git
```

## New machine

```sh
git clone --bare git@github.com:JoshuaEstes/dotfiles.git "$HOME/.dotfiles"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME -C $HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

# Requirements

* Vundle
* TPM (Tmux Plugin Manager)

# Key Files and Directories

* `.tmux.conf` – Configures tmux key bindings, the status line, and plugins.
* `.zshrc` – Defines the Z shell environment, including aliases and plugin loading.
* `.vimrc` – Sets Vim options, mappings, and plugin configuration.
* `bin/` – Contains executable scripts that are added to your `PATH`.
* `.gitconfig.d/` – Holds additional Git configuration snippets sourced by `.gitconfig`.

# Customization

Tailor these files to match your workflow. Update the configuration files directly or add
new scripts to `bin/` to introduce custom commands. Drop extra Git configuration files
into `.gitconfig.d/` to extend your Git setup. When adjusting tmux, Zsh, or Vim settings,
follow the plugin installation steps above to keep everything in sync across machines.
