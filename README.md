JoshuaEstes/dotfiles
====================

These are my dotfiles. There are many others like it, but this one is mine. My
dotfiles is my best friend. It is my life. I must master it as I must master
my life. Without me, my dotfiles are useless. Without my dotfiles, I am useless.

## Installation

```bash
cd $HOME
git clone git://github.com/JoshuaEstes/dotfiles.git .dotfiles
cd .dotfiles
./script/install
```
## Updating

Just run the [up](https://github.com/JoshuaEstes/dotfiles/blob/master/bin/up) command
and it will update based on OS.

```bash
up
```

## Extras

* [Cheat Sheets](https://gist.github.com/JoshuaEstes/2627607)
   * Cheat sheets for bash, tmux, vim, git, etc.

## Configuration

Edit `~/.gitconfig` to your liking


## Git Commands Added

* `git hooks update` - Updates the hooks you have in your template directory to the current
repository you are working in. See the file `bin/git-hooks` for more
information.

## Git Hooks

I have various hooks that will run when various events happen. These hooks work
for me and I have setup a framework around using them which others might find
useful. Some documentation can be found in
`gitconfig.d/templates/hooks/README.md`.

## Email

Mutt is used for email along with `ppl` for the address book part in which
contact information is store. The address book is configured to keep files in
`$HOME/.AddressBook` directory.

Mailboxes are stored in `$HOME/Mail` and this project does support multiple
accounts.

offlineimap is used to sync mail from servers. You do not need to be connected
to the internet to read email, however you must be connected to sync email.

msmtp is used to send emails.

### Security

GnuPG is used to store credentials and these credentials are stored in
`$HOME/.pw` and can be setup to be a git repository.

## IRC

irssi is used to connect to IRC.

## tmux

tmux is used for various things. Use it and love it.
