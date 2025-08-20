####
# ~/.zshrc
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

[[ -f ~/.env ]] && source ~/.env
[[ -f ~/.env.zsh ]] && source ~/.env.zsh
[[ -f ~/.env.local ]] && source ~/.env.local
[[ -f ~/.env.zsh.local ]] && source ~/.env.zsh.local

if [[ -n "$PMS" && -f "$PMS/pms.sh" ]]; then
    source "$PMS/pms.sh" zsh
else
    print -u2 "Warning: PMS script not found; skipping PMS integration"
fi
