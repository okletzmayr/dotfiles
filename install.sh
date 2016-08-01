#!/bin/bash

DIR=$( cd "$( dirname "$0" )" && pwd )

relink() {
  if [[ -h "$1" ]]; then
    echo -e "Relinking $1"
    rm "$1"
    ln -s "$2" "$1"
  elif [[ ! -e "$1" ]]; then
    echo -e "Linking $1 to $2"
    ln -s "$2" "$1"
  else
    echo -e "$1 exists as a real file, skipping."
  fi
}

settermprofile() {
  local UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/ "$@"
}

echo -e "\nInstalling dotfiles...\n"
  relink ~/.config/powerline     $DIR/config/powerline
  relink ~/.gnupg/gpg-agent.conf $DIR/gnupg/gpg-agent.conf
  relink ~/.bashrc               $DIR/bashrc
  relink ~/.gitconfig            $DIR/gitconfig
  relink ~/.gitignore            $DIR/gitignore
  relink ~/.inputrc              $DIR/inputrc
  relink ~/.tmux.conf            $DIR/tmux.conf
  relink ~/.vimrc                $DIR/vimrc
  relink ~/.togglebg.sh          $DIR/togglebg.sh
echo -e "done."

if ! [ -d ~/.vim/bundle/Vundle.vim  ]; then
  echo -e "\nInstalling Vundle.vim...\n"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo -e "\nRunning VundleInstall...\n"
  vim +PluginInstall +qall
  echo -e "done."
fi

if ! [ -d ~/.local/share/fonts ]; then
  echo -e "\nInstalling fonts for powerline...\n"
  $DIR/submodules/powerline-fonts/install.sh
  echo -e "done."
fi

if [ ! -f ~/.local/bin/bfg.jar  ]; then
  echo -e "\nInstalling BFG..."
  if [ ! -d ~/.local/bin ]; then
    mkdir ~/.local/bin
  fi
  $(wget --content-disposition 'https://search.maven.org/remote_content?g=com.madgag&a=bfg&v=LATEST' -O ~/.local/bin/bfg.jar -q --show-progress)
  echo -e "done."
fi

echo -e "\nSetting up Gnome-Terminal...\n"
  settermprofile background-color "rgb(0,43,54)"
  settermprofile foreground-color "rgb(131,148,150)"
  settermprofile default-size-columns "120"
  settermprofile default-size-rows "48"
  settermprofile font "Ubuntu Mono derivative Powerline 12"
  settermprofile palette "['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']"
  settermprofile scrollbar-policy "never"
  settermprofile use-system-font "false"
  settermprofile use-theme-colors "false"
  settermprofile use-theme-transparency "false"
  gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar "false"
  gsettings set org.gnome.Terminal.Legacy.Settings menu-accelerator-enabled "false"
echo -e "done."
