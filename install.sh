#!/bin/bash

relink() {
  if [[ -h "$1" ]]; then
    echo "Relinking $1"
    rm "$1"
    ln -s "$2" "$1"
  elif [[ ! -e "$1" ]]; then
    echo "Linking $1 to $2"
    ln -s "$2" "$1"
  else
    echo "$1 exists as a real file, skipping."
  fi
}

DIR=$( cd "$( dirname "$0" )" && pwd )
echo $DIR

relink ~/.config/powerline $DIR/config/powerline
relink ~/.bashrc           $DIR/bashrc
relink ~/.gitconfig        $DIR/gitconfig
relink ~/.gitignore        $DIR/gitignore
relink ~/.inputrc          $DIR/inputrc
relink ~/.tmux.conf        $DIR/tmux.conf
relink ~/.vimrc            $DIR/vimrc
