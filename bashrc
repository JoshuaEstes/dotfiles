# ~/.bashrc

# If any default stuff is found, let's use that stuff first
if [ -f /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
elif [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

unset MAILCHECK

# Make sure we use VIM =D
EDITOR=vim
SVN_EDITOR=vim

# This is also set in the gitconfig file. When you first do a git init
# on a directory, this will use the contents of this directory as a template
# so we can place hooks we want to always include here
GIT_TEMPLATE_DIR=$HOME/.gitconfig.d/git-core/templates

# @see https://wiki.archlinux.org/index.php/Color_Bash_Prompt
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensty
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensty
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensty backgrounds
On_IBack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[10;95m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

# include functions before aliases so aliases can use them
if [ -f $HOME/.bash.d/functions ]; then
  source $HOME/.bash.d/functions
fi

if [ -f $HOME/.bash.d/aliases ]; then
  source $HOME/.bash.d/aliases
fi

if [ -f $HOME/.bash.d/completions ]; then
  source $HOME/.bash.d/completions
fi

# Used in PS1
parse_git_branch () {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/\^0$//' | sed 's#refs\/heads\/\(.*\)#\1#'
}

# Still playing around with title bars
case $TERM in
  xterm | xterm-color)
    TITLE_BAR="\[\e]0;\w\a\]"
  ;;
esac
# Display the title bar and the prompt
PS1="$TITLE_BAR\[$White\]\u@\h:\[$Green\]\w \[$BRed\]\$(parse_git_branch)\[$White\] \$ "




