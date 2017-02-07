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

echo -e "\nchecking submodules..."
  # remember original dir to switch back to after git command
  OLDDIR=$(pwd)
  cd $DIR
  git submodule update --init --recursive
  cd $OLDDIR
echo -e "done."

echo -e "\ncreating directories..."
  vmkdir -p ~/.gnupg
  vmkdir -p ~/.local/bin
  vmkdir -p ~/.tmux
  vmkdir -p ~/.vim/tmp
echo -e "done."

echo -e "\ninstalling dotfiles...\n"
  relink ~/.gnupg/gpg-agent.conf $DIR/gnupg/gpg-agent.conf
  relink ~/.gitconfig            $DIR/gitconfig
  relink ~/.gitignore            $DIR/gitignore
  relink ~/.tmux.conf            $DIR/tmux.conf
  relink ~/.vimrc                $DIR/vimrc
  relink ~/.zshrc                $DIR/zshrc
echo -e "done."

if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
  echo -e "\ninstalling Vundle.vim...\n"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo -e "\nrunning VundleInstall...\n"
  vim +PluginInstall +qall
  echo -e "done."
fi

if ! [ -d ~/.config/base16-shell ]; then
  echo -e "\ncloning base16-shell...\n"
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
  echo -e "done."
fi

if ! [ -d ~/.config/base16-gnome-terminal ]; then
  echo -e "\ncloning base16-gnome-terminal...\n"
  git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal
  echo -e "done."
fi

if ! [ -d ~/.tmux/themepack ]; then
  echo -e "\ncloning tmux-themepack\n"
  git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux/themepack
  echo -e "done."
fi

if ! [ -d ~/.local/share/fonts ]; then
  echo -e "\ninstalling fonts for powerline...\n"
  $DIR/submodules/powerline-fonts/install.sh
  echo -e "done."
fi

if [ ! -f ~/.local/bin/bfg.jar  ]; then
  echo -e "\ninstalling BFG..."
  $(wget --content-disposition 'https://search.maven.org/remote_content?g=com.madgag&a=bfg&v=LATEST' -O ~/.local/bin/bfg.jar -q --show-progress)
  echo -e "done."
fi
