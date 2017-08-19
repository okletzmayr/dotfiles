# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# show command execution time in history
HIST_STAMPS="yyyy-mm-dd"

# customizations
ZSH_THEME="custom1"


# plugins (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(docker git osx vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
# aliases
alias vim='nvim'

# base16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_tomorrow-night

# gpg agent variables
if [ -f "${HOME}/.gpg-agent-info" ]; then
   . "${HOME}/.gpg-agent-info"
     export GPG_AGENT_INFO
     export SSH_AUTH_SOCK
     export SSH_AGENT_PID
fi

# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export VIRTUAL_ENV_DISABLE_PROMPT=1
