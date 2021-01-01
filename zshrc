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
plugins=(django docker docker-compose dotenv git gitignore gpg-agent osx pipenv)

source $ZSH/oh-my-zsh.sh

#################################### aliases ###################################
# use neovim as vim
alias vim='nvim'
alias lstty='ls /dev | grep -E "^(tty\.|cu\.)" --color=never'

##################################### misc #####################################
# iTerm integration
[[ $TERM_PROGRAM == 'iTerm.app' ]] && \
  test -e "${HOME}/.iterm2_shell_integration.zsh" && \
  source "${HOME}/.iterm2_shell_integration.zsh"

################################### python #####################################

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

# pipx
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
function __virtualenv_ps1 {
    echo "${VIRTUAL_ENV:+(${VIRTUAL_ENV##*/})}"
}

export RPROMPT="\$(__virtualenv_ps1)"

##################################### ruby #####################################
eval "$(rbenv init -)"

