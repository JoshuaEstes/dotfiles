#!/usr/bin/env zsh
####
#
#
#

# To be used with taskwarrior
# Usage:
# ```
# tickle monday Takeout trash
# tickle 2099-12-31 End of the world
# ```
function tickle() {
    local deadline=$1
    shift
    task add +in +tickle wait:$deadline $@
}

function read_and_review() {
    link=$1
    title=$(wget -qO- "$*" | hxselect -s '\n' -c  'title' 2>/dev/null)
    echo $title
    local descr="\"Read and review: $title\""
    local id=$(task add +next +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}

# Task Warrior Aliases
alias t='task'
#update this alias to be a function, have aruments be optional and if
# no argument is passed in that it will just print the inbox report
alias in='task add +in'

alias think='tickle +1d' # Think it over for one day
alias rnd='task add +rnd' # Research and Development
alias rnr=read_and_review # Read and Review
