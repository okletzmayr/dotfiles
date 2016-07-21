# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Function _dir_chomp for GIT_PS1
function _dir_chomp {
  local IFS=/ c=1 n d
  local p=(${1/#$HOME/\~}) r=${p[*]}
  local s=${#r}
  while ((s>$2&&c<${#p[*]}-1))
  do
    d=${p[c]}
    n=1;[[ $d = .* ]]&&n=2
    ((s-=${#d}-n))
    p[c++]=${d:0:n}
  done
  echo "${p[*]}"
}

function weather {
  local CITY=$1
  local response=$(eval 'curl -s -N wttr.in/$1 | head -n 7')
  if [ "$response" != "ERROR" ]
  then
    echo "$response"
  else
    echo "Weather request failed."
  fi
}

function gz {
  local original=$(eval 'stat --printf="%s" ${1}')
  echo "orig size: $original"
  local gzipped=$(eval 'gzip -c $1 | wc -c')
  echo "gzip size: $gzipped"
}

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -AFhl --group-directories-first'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# some aliases
alias gpg='gpg2'
alias bfg='java -jar ~/.local/bin/bfg.jar'
alias docker-node='docker run --rm --name dev_node -itv $PWD:/usr/src/app -v $HOME/.npm/node_modules:/usr/local/lib/node_modules -w /usr/src/app -p 3000:3000 node:slim bash'

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='$(_dir_chomp "$(pwd)" 16)$(__git_ps1)$ '
