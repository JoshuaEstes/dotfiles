# ~/.bashrc

# If any default stuff is found, let's use that stuff first
if [ -f /etc/bash.bashrc ]; then
  source /etc/bash.bashrc
elif [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

if [ -f $HOME/.bash.local ]; then
  source $HOME/.bash.local
fi

if [ $(uname) == 'Linux' ]; then
  eval `dircolors $HOME/.dir_colors`
elif [ $(uname) == 'Darwin' ]; then
  eval `gdircolors $HOME/.dir_colors`
fi

unset MAILCHECK
shopt -s extglob

# default is emacs
#set -o vi

# Make sure we use VIM =D
EDITOR=vim
SVN_EDITOR=vim
BROWSER=chromium-browser

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

# Still playing around with title bars
case $TERM in
  xterm | xterm-color)
    TITLE_BAR="\[\e]0;\w\a\]"
  ;;
esac
# Display the title bar and the prompt
PS1="\[\033[G\]$TITLE_BAR\[$White\]\u@\h:\[$Green\]\w\[$BRed\] \$(__git_ps1 "%s")\[$White\]\n\$ "


export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
