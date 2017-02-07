# history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space

# vi keybindings
# http://superuser.com/questions/476532
bindkey -v
export KEYTIMEOUT=1
bindkey '^P' up-history
bindkey '^N' down-history
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey '^U' backward-kill-line
bindkey -sM vicmd '^[' '^G'
bindkey -rM viins '^X'
bindkey -M viins '^X,' _history-complete-newer \
                 '^X/' _history-complete-older \
                 '^X`' _bash_complete-word

# Prompt
export  PROMPT="[%2~] "

# auto completion
autoload -Uz compinit
compinit -u
fpath=(/usr/local/share/zsh-completions $fpath)

# base16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_tomorrow-night

# aliases
alias vim=nvim
alias ll='/usr/local/opt/coreutils/libexec/gnubin/ls -lAh --group-directories-first'

# disable XON/XOFF flow control
stty -ixon
