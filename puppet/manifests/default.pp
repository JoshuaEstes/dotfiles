####
#
# Make sure all my tools are installed on the server
#

package { "tmux":
    ensure => present
}

package { "vim":
    ensure => present
}

package { "irssi":
    ensure => present
}
