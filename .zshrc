set -o emacs
set -o noclobber

export EDITOR="vim"

#bind '"\C-b": beginning-of-line'

export LANG=en_US.UTF-8

export PROMPT='%(?.%F{green}√.%F{red}?%?)%f %F{blue}[%T] %B%F{240}%3~%f%b %# '


# random zsh aliases and functions
alias ls="ls -GFlthrs"
alias rm='rm -i'

# kgb = kill git branch
kgb(){
  git checkout master
  git fetch -p
  git pull
  git branch -D "$1"
}

mkcd() {
  case "$1" in /*) :;; *) set -- "./$1";; esac
  mkdir -p "$1" && cd "$1"
}

agrep() {
  grep -ir "$1" *
}

cgrep(){
  grep -ir --include "*.cpp" --include "*.h" "$1" .
}
