################################## oh-my-zsh ###################################
# path to the oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# set lang in case it's not set via Terminal Application
export LANG=en_US.UTF-8

# show command execution time in history
HIST_STAMPS="yyyy-mm-dd"

# customizations
ZSH_CUSTOM=$HOME/.config/zsh
ZSH_THEME="custom1"

# plugins (others can be found in ~/.oh-my-zsh/plugins/*)
plugins=(docker dotenv git gitignore gpg-agent jsontools osx pyenv vi-mode)

source $ZSH/oh-my-zsh.sh

#################################### aliases ###################################
# use neovim as vim
alias vim='nvim'

################################## color theme #################################
# base16 color theme
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_eighties

##################################### misc #####################################
# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

################################## javascript ##################################
# use node from nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

################################### python #####################################
# pyenv and pyenv-virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# pip completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

