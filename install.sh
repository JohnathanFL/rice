#!/bin/sh

RICE=`pwd`


# TODO: Fill this with all essential packages
PACKAGES="
kitty
wlroots-git
sway-git
swaybg-git
swaylock

"


install_packages() {
	yay --sudoloop --noconfirm -S $(echo $PACKAGES | xargs)
}

read -p "Installing: $PACKAGES y/n?:  " shouldInstall
case $shouldInstall in
	[Yy]* ) install_packages;;
	*     ) echo "Not installing packages";;
esac

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

echo wallpaper setter
rm ~/bin/setwall
ln -s $RICE/setwall ~/bin/



echo qutebrowser
mkdir -p ~/.config/qutebrowser
rm ~/.config/qutebrowser/config.py
ln -s $RICE/quteconfig.py ~/.config/qutebrowser/config.py

echo mpd.conf
mkdir -p ~/.config/mpd
rm ~/.config/mpd/mpd.conf
ln -s $RICE/mpd.conf ~/.config/mpd/mpd.conf

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



echo "/etc/issue"
sudo rm /etc/issue
sudo ln -s $RICE/issue /etc/issue

echo "brightnessd.sh"
sudo rm /usr/local/bin/brightnessd
sudo rm /etc/systemd/system/brightnessd.service

sudo ln -s $RICE/brightnessd/brightnessd.sh /usr/local/bin/
sudo ln -s $RICE/brightnessd/brightnessd.service /etc/systemd/system/

sudo systemctl enable brightnessd
sudo systemctl start brightnessd
