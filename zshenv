#!/usr/bin/env zsh
####
#
# ENV file
#
# Executes first
#

# An array (colon-separated list) of directories specifying the search path for
# the cd command.
cdpath=(~/Code)

# If  set,  is  treated as a pattern during spelling correction.  Any potential
# correction that matches the pattern is ignored.  For example, if the value is
# `_*' then completion  functions (which,  by convention, have names beginning
# with `_') will never be offered as spelling corrections.  The pattern does
# not apply to the correction of file names, as applied by the CORRECT_ALL
# option  (so  with  the  example  just given files beginning with `_' in the
# current directory would still be completed).
#CORRECT_IGNORE='_*'

# If set, is treated as a pattern during spelling correction of file names.
# Any file name that matches the pattern is never offered as a correction.  For
# example, if the value is `.*' then dot file names will never be offered as
# spelling corrections.  This is useful with  the  CORRECT_ALL option.
#CORRECT_IGNORE_FILE='$HOME/.zshignore'

DIRSTACKSIZE=10
FCEDITOR=vim
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1 # 0.1 second delay
watch=(notme)
export EDITOR=vim
