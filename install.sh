#!/bin/sh

DIR=$( cd "$( dirname "$0" )" && pwd )

# link if new file, re-link if target is a link,
# append '.old' to real files if replaced
relink() {
  if [[ -h "$1" ]]; then
    echo "relinking $1"
    rm "$1"
    ln -s "$2" "$1"
  elif [[ ! -e "$1" ]]; then
    echo "linking $1 to $2"
    ln -s "$2" "$1"
  else
    mv $1 "$1.old"
    ln -s "$2" "$1"
    echo "linking $1 to $2 (created backup as $1.old)"
  fi
}

# verbose mkdir
vmkdir() {
  mkdir -p $1
  echo "created directory: $1"
}

echo "\ncreating directories..."
  vmkdir $HOME/.config/nvim/tmp
  vmkdir $HOME/.config/zsh/themes
  vmkdir $HOME/.config/tmux
  vmkdir $HOME/.gnupg
echo "done."

echo "\ninstalling dotfiles...\n"
  relink $HOME/.config/nvim/init.vim                  $DIR/config/nvim/init.vim
  relink $HOME/.config/zsh/themes/custom1.zsh-theme   $DIR/config/zsh/themes/custom1.zsh-theme
  relink $HOME/.gnupg/gpg-agent.conf                  $DIR/gnupg/gpg-agent.conf
  relink $HOME/.gitconfig                             $DIR/gitconfig
  relink $HOME/.gitignore                             $DIR/gitignore
  relink $HOME/.ideavimrc                             $DIR/ideavimrc
  relink $HOME/.tmux.conf                             $DIR/tmux.conf
  relink $HOME/.vimrc                                 $DIR/vimrc
  relink $HOME/.zshrc                                 $DIR/zshrc
echo "done."

if ! [ -d ~/.config/nvim/bundle/Vundle.vim ]; then
  echo "\ninstalling Vundle.vim...\n"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
  echo "\nrunning VundleInstall...\n"
  nvim +PluginInstall +qall
  echo "done."
fi

if ! [ -d ~/.config/tmux/themepack ]; then
  echo "\ninstalling tmux themepack...\n"
  git clone https://github.com/jimeh/tmux-themepack.git ~/.config/tmux/themepack
  echo "done."
fi

