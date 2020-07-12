#!/bin/sh

RICE=$(pwd)

ensureDir() {
  if [ -e "$1" ]; then
    if ! [ -d "$1" ]; then
      echo "Install would overwrite file $1 as a dir!"
      exit 1
    fi
  else
    mkdir -p "$1"
  fi
}

# install() is to be preferred, as it should be a little safer
installAs() {
  srcFilename="$(basename "$1")"
  destDir="$(dirname "$2")"
  destName="$(basename "$2")"
  printf "  Installing %-22s to %-40s as %s\n" "$srcFilename" "$destDir" "$destName"
  ensureDir "$destDir"
  ln -sfT "$1" "$destDir/$destName"
}

install() {
  filename="$(basename "$1")"
  printf "  Installing %-22s to %s\n" "$filename" "$2"
  ensureDir "$2"
  rm -rf "$2/$filename"
  ln -sfT "$1" "$2/$filename"
}

# Make sure we have plug.kak, etc
git submodule init
git submodule update

# basics
mkdir -p ~/bin
mkdir -p ~/.config


# Todo: makeQuteContainer()
echo qutebrowser profiles
mkdir -p ~/.local/share/qutebrowser-containers/
sed "s/CONTAINER/container/g" $RICE/qutebrowser-template.desktop \
  > ~/.local/share/applications/qutebrowser-container.desktop

echo "Installing items..."
install   $RICE/clang-format          ~/
install   $RICE/fish                  ~/.config/
install   $RICE/kak                   ~/.config/
install   $RICE/.profile              ~/
install   $RICE/bemenu.sh             ~/bin
install   $RICE/awesome               ~/.config
install   $RICE/sway                  ~/.config
install   $RICE/launcher.sh           ~/bin
install   $RICE/luakit                ~/.config
install   $RICE/kitty/                ~/.config 
install   $RICE/waybar                ~/.config
install   $RICE/wallpaper.sh          ~/bin
install   $RICE/wldash                ~/.config
installAs $RICE/vimrc                 ~/.vimrc
installAs $RICE/quteconfig.py         ~/.config/qutebrowser/config.py
install   $RICE/qutebrowser-container ~/bin/
install   $RICE/mpd.conf              ~/.config/mpd/
install   $RICE/mvi                   ~/bin
install   $RICE/notify-at             ~/bin
installAs $RICE/mako                  ~/.config/mako/config
install   $RICE/ncmpcpp               ~/.ncmpcpp/
install   $RICE/kickbar               ~/bin/
install   $RICE/zathura               ~/.config/


echo "/etc/issue requires manual installation"
