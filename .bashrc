set -o emacs

#bind '"\C-b": beginning-of-line'

export LANG=en_US.UTF-8

export PS1="\[\e[00;37m\]\u@\h [\t] \n\w \\$ \[\e[0m\]"
export PATH=${PATH}:/home/dkurtzbe/local/${OSTYPE}/bin:/home/phab/bin:/home/wwong295/scripts
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/dkurtzbe/local/${OSTYPE}/lib:$BLPAPI_ROOT/Linux
export BLPAPI_ROOT=/bb/mbig/mbig3931/utils/blpapi_cpp_3.8.8.1
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
