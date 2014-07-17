JoshuaEstes/dotfiles
====================

This is my dotfile. There are many others like it, but this one is mine. My
dotfile is my best friend. It is my life. I must master it as I must master
my life. Without me, my dotfile is useless. Without my dotfile, I am useless.

# Installation

    cd $HOME
    git clone git://github.com/JoshuaEstes/dotfiles.git
    cd dotfiles
    ./install.sh
    
This will create a ~/.dotfiles directory with the correct files in it.

# Updating

    cd ~/dotfiles
    git pull origin master
    ./install.sh

Updating should be pretty easy and straight forward.

# Extras

* [Cheat Sheets](https://gist.github.com/2627607)
 * Cheat sheets for bash, tmux, vim, etc

# Vim Bundles

* [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip)
 * [help](https://raw.github.com/vim-scripts/bufexplorer.zip/master/doc/bufexplorer.txt)
* [fugitive](https://github.com/tpope/vim-fugitive)
 * [help](https://raw.github.com/tpope/vim-fugitive/master/doc/fugitive.txt)
* [nerdtree](https://github.com/scrooloose/nerdtree)
 * [help](https://raw.github.com/scrooloose/nerdtree/master/doc/NERD_tree.txt)
* [solarized](https://github.com/altercation/vim-colors-solarized)
 * [help](https://raw.github.com/altercation/vim-colors-solarized/master/doc/solarized.txt)
* [syntastic](https://github.com/scrooloose/syntastic)
 * [help](https://raw.github.com/scrooloose/syntastic/master/doc/syntastic.txt)
* [tabular](https://github.com/godlygeek/tabular)
 * [help](https://raw.github.com/godlygeek/tabular/master/doc/Tabular.txt)
* [tagbar](https://github.com/majutsushi/tagbar)
 * [help](https://raw.github.com/majutsushi/tagbar/master/doc/tagbar.txt)
* [ultisnips](https://github.com/SirVer/ultisnips)
 * [help](https://raw.github.com/SirVer/ultisnips/master/doc/UltiSnips.txt)
 * [List of snippets](https://github.com/SirVer/ultisnips/tree/master/UltiSnips)

# Vim Usage

There are a lot of customized settings included, to check them out, see the vimrc
file. You may also want to checkout my [Cheat Sheets](https://gist.github.com/2627607).

Below you will also find some basic information about some of the plugins. This is
not meant to be a complete list, but some of the commands I use most often.

## Key Mappings

    F2            Toggle NerdTree
    F3            Toggle Tagbar
    F4            Show snips that can be inserted into the file
    F5            Rebuild tags file
    F11           Previous buffer
    F12           Next buffer
    shift + F11   Previous tab
    shift + F12   Next tab

## bufexplorer usage

    \be           Normal open
    \bs           Horizontal split (q quits)
    \bv           Vertical split (q quits)

With bufexplorer open

    enter        Open buffer
    t            Open buffer in new tab
    D            Close buffer

## NERD Tree

    o            Open
    go           Open but leave cursor in NERDTree
    t            Open in new tab
    q            Close NERDTree window
