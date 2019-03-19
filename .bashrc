set -o emacs
set -o noclobber

export EDITOR="vim"

#bind '"\C-b": beginning-of-line'

export LANG=en_US.UTF-8

export PS1="\[\e[00;35m\]\u@\h [\t]  \[\e[0;32m\]\n\w \\$ \[\e[0m\]"


# random bash aliases and functions
alias ls="ls --color=auto --classify -lthrs"
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
