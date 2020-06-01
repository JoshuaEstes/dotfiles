####
# .zshenv
#
# |               | Interactive | Interactive | Script |
# |               | login       | non-login   |        |
# | ------------- | ----------- | ----------- | ------ |
# | /etc/zshenv   | A           | A           | A      |
# | ~/.zshenv     | B           | B           | B      |
# | /etc/zprofile | C           |             |        |
# | ~/.zprofile   | D           |             |        |
# | /etc/zshrc    | E           | C           |        |
# | ~/.zshrc      | F           | D           |        |
# | /etc/zlogin   | G           |             |        |
# | ~/.zlogin     | H           |             |        |
# | ------------- | ----------- | ----------- | ------ |
# | ~/.zlogout    | I           |             |        |
# | /etc/zlogout  | J           |             |        |
####
