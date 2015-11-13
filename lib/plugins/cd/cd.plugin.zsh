#!/usr/bin/env zsh
####
#
#
#

# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
# This option is only applicable if the option SHIN_STDIN is set, i.e. if
# commands are being read from standard input. The option is designed for
# interactive use; it is recommended that cd be used explicitly in scripts to
# avoid ambiguity.
setopt AUTO_CD

# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

# If the argument to a cd command (or an implied cd with the AUTO_CD option
# set) is not a directory, and does not begin with a slash, try to expand the
# expression as if it were preceded by a ‘~’ (see Filename Expansion).
setopt CDABLEVARS

# When changing to a directory containing a path segment ‘..’ which would
# otherwise be treated as canceling the previous segment in the path (in other
# words, ‘foo/..’ would be removed from the path, or if ‘..’ is the first part
# of the path, the last part of the current working directory would be
# removed), instead resolve the path to the physical directory. This option is
# overridden by CHASE_LINKS.
#
# For example, suppose /foo/bar is a link to the directory /alt/rod. Without
# this option set, ‘cd /foo/bar/..’ changes to /foo; with it set, it changes to
# /alt. The same applies if the current directory is /foo/bar and ‘cd ..’ is
# used. Note that all other symbolic links in the path will also be resolved.
#setopt CHASE_DOTS

# Resolve symbolic links to their true values when changing directory. This
# also has the effect of CHASE_DOTS, i.e. a ‘..’ path segment will be treated
# as referring to the physical parent, even if the preceding path segment is a
# symbolic link.
setopt CHASE_LINKS

# Don’t push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a
# directory in the stack.
setopt PUSHD_MINUS

# Do not print the directory stack after pushd or popd.
#setopt PUSHD_SILENT

# Have pushd with no arguments act like ‘pushd $HOME’'.
#setopt PUSHD_TO_HOME

alias -- -='cd -'
