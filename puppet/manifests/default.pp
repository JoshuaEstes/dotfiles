####
#
# Make sure all my tools are installed on the server
#
$packages = [
    'tmux',
    'vim',
]

package { $packages:
    ensure => present
}
