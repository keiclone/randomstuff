set -o emacs

#bind '"\C-b": beginning-of-line'

export LANG=en_US.UTF-8

export PS1="\[\e[00;37m\]\u@\h [\t] \n\w \\$ \[\e[0m\]"
#export MANPATH=$MANPATH:/home/user/wilwong/utils/tmux/share/man


#random bash aliases and functions
alias ls="ls --color=auto --classify -lthrs"
alias rm='rm -i'

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
