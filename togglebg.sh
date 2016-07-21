#!/bin/bash
# TODO: integrate into vim and powerline

UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")
CURRENT_SCHEME=$(gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/ background-color | sed "s/'//g")

setdconf() {
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$UUID/ "$@"
}

dbg="rgb(0,43,54)"
dfg="rgb(131,148,150)"
lbg="rgb(253,246,227)"
lfg="rgb(101,123,131)"

if [ "$CURRENT_SCHEME" == "$dbg" ]; then
  setdconf background-color $lbg
  setdconf foreground-color $lfg
elif [ "$CURRENT_SCHEME" == "$lbg" ]; then
  setdconf background-color $dbg
  setdconf foreground-color $dfg
else
  echo "It doesn't appear that Solarized is the default colorscheme in gnome-terminal."
fi
