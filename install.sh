#!/bin/sh

DIR=$( cd "$( dirname "$0" )" && pwd )

# link if new file, re-link if target is a link,
# append '.old' to real files if replaced
relink() {
  if [[ -h "$1" ]]; then
    echo -e "relinking $1"
    rm "$1"
    ln -s "$2" "$1"
  elif [[ ! -e "$1" ]]; then
    echo -e "linking $1 to $2"
    ln -s "$2" "$1"
  else
    mv $1 "$1.old"
    ln -s "$2" "$1"
    echo -e "linking $1 to $2 (created backup as $1.old)"
  fi
}

# verbose mkdir
vmkdir() {
  mkdir -p "$1"
  echo -e "created directory: $1"
}

echo -e "\ncreating directories..."
  vmkdir -p ~/.config/nvim/tmp
  vmkdir -p ~/.config/zsh/themes
  vmkdir -p ~/.config/tmux
  vmkdir -p ~/.gnupg
echo -e "done."

echo -e "\ninstalling dotfiles...\n"
  relink ~/.config/zsh/themes/custom1.zsh-theme   $DIR/config/zsh/themes/custom1.zsh-theme
  relink ~/.config/nvim/init.vim                  $DIR/config/nvim/init.vim
  relink ~/.gitconfig                             $DIR/gitconfig
  relink ~/.gitignore                             $DIR/gitignore
  relink ~/.ideavimrc                             $DIR/ideavimrc
  relink ~/.tmux.conf                             $DIR/tmux.conf
  relink ~/.vimrc                                 $DIR/vimrc
  relink ~/.zshrc                                 $DIR/zshrc
echo -e "done."

if ! [ -d ~/.config/nvim/bundle/Vundle.vim ]; then
  echo -e "\ninstalling Vundle.vim...\n"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
  echo -e "\nrunning VundleInstall...\n"
  nvim +PluginInstall +qall
  echo -e "done."
fi

if ! [ -d ~/.config/tmux/themepack ]; then
  echo -e "\ninstalling tmux themepack...\n"
  git clone https://github.com/jimeh/tmux-themepack.git ~/.config/tmux/themepack
  echo -e "done."
fi

