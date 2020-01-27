#!/bin/sh

RICE=$(pwd)

# TODO: Fill this with all essential packages
PACKAGES="
kitty
wlroots-git
sway-git
swaybg-git
swaylock
socat"

install_packages() {
  yay --sudoloop --noconfirm -S $(echo $PACKAGES | xargs)
}

echo -e -n "Install: $PACKAGES\ny/n?:  "
read shouldInstall
if [[ "$shouldInstall" =~ ^[Yy]$ ]]; then
  install_packages
else
  echo "Not installing packages"
fi

# Setup
mkdir -p ~/bin
mkdir -p ~/.config

echo clang-format
rm ~/.clang-format
ln -s $RICE/clang-format ~/.clang-format

echo kak
rm -rf ~/.config/kak
ln -s $RICE/kak ~/.config/kak

echo plug.kak
if [ ! -d ~/.config/kak/plugins/plug.kak/ ]; then
  mkdir -p ~/.config/kak/plugins/
  git clone https://github.com/andreyorst/plug.kak.git ~/.config/kak/plugins/plug.kak
fi

echo zshrc
rm ~/.zshrc
ln -s $RICE/zshrc ~/.zshrc

echo bemenu.sh
ln -s $RICE/bemenu.sh ~/bin

echo awesome configs
rm -rf ~/.config/awesome
ln -s $RICE/awesome ~/.config/awesome

echo sway configs
rm -rf ~/.config/sway/
mkdir ~/.config/sway
ln -s $RICE/sway ~/.config/sway/config

echo launcher
rm ~/bin/launcher.sh
ln -s $RICE/launcher.sh ~/bin/launcher.sh

echo kitty
rm -rf ~/.config/kitty
mkdir ~/.config/kitty
ln -s $RICE/kitty.conf ~/.config/kitty/

echo wayfire
rm ~/.config/wayfire.ini
ln -s $RICE/wayfire.ini ~/.config/

echo waybar
rm ~/.config/waybar -rf
ln -s $RICE/waybar ~/.config

echo wallpaper setter
rm ~/bin/setwall
ln -s $RICE/wallpaper.sh ~/bin/setwall

echo wldash
rm -rf ~/.config/wldash
ln -s $RICE/wldash ~/.config/

echo vim
rm ~/.vimrc
ln -s $RICE/vimrc ~/.vimrc
cd /tmp
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein

echo qutebrowser
mkdir -p ~/.config/qutebrowser
rm ~/.config/qutebrowser/config.py
ln -s $RICE/quteconfig.py ~/.config/qutebrowser/config.py

echo qutebrowser profiles
mkdir -p ~/.local/share/qutebrowser-containers/
ln -s $RICE/qutebrowser-container ~/bin/
# Desktop file for selecting which container
sed "s/CONTAINER/container/g" $RICE/qutebrowser-template.desktop > ~/.local/share/applications/qutebrowser-container.desktop

echo mpd.conf
mkdir -p ~/.config/mpd
rm ~/.config/mpd/mpd.conf
ln -s $RICE/mpd.conf ~/.config/mpd/mpd.conf

echo mvi
rm -rf ~/.config/mvi
git clone https://github.com/occivink/mpv-image-viewer ~/.config/mvi
echo '#!/bin/sh
mpv $@ --config-dir="$HOME/.config/mvi"
' > ~/bin/mvi
chmod +x ~/bin/mvi

echo notify-at
ln -s $RICE/notify-at ~/bin > /dev/null

echo mako notifications
rm -rf ~/.config/mako
mkdir ~/.config/mako
ln -s $RICE/mako ~/.config/mako/config

echo ncmpcpp
mkdir ~/.ncmpcpp
rm ~/.ncmpcpp/config
ln -s $RICE/ncmpcpp ~/.ncmpcpp/config

echo kickbar
rm ~/bin/kickbar
ln -s $RICE/kickbar ~/bin/kickbar

sudo_stuff() {
  echo "/etc/issue"
  sudo rm /etc/issue
  sudo ln -s $RICE/issue /etc/issue

  echo "brightnessd.sh"
  sudo rm /usr/local/bin/brightnessd.sh
  sudo rm /etc/systemd/system/brightnessd.service

  sudo ln -s $RICE/brightnessd/brightnessd.sh /usr/local/bin/
  sudo ln -s $RICE/brightnessd/brightnessd.service /etc/systemd/system/

  sudo systemctl enable brightnessd
  sudo systemctl start brightnessd
}

echo -n "Install things requiring sudo? (issue/etc) [y/n]: "
read answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  sudo_stuff
else
  echo "NOT doing sudo stuff then, got it boss"
fi
