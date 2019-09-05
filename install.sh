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



echo zshrc
rm ~/.zshrc
ln -s $RICE/zshrc ~/.zshrc

echo awesome configs
rm -rf ~/.config/awesome
ln -s $RICE/awesome ~/.config/awesome

echo sway configs
rm -rf ~/.config/sway
ln -s $RICE/sway ~/.config/sway

echo launcher
rm ~/bin/launcher.sh
ln -s $RICE/launcher.sh ~/bin/launcher.sh


# TODO: May deprecate qtcreator
echo qtcreator themes
mkdir -p ~/.config/QtProject/qtcreator/styles
rm ~/.config/QtProject/qtcreator/styles/darcula.xml
ln -s $RICE/themes/Qt-Creator-Darcula/darcula.xml ~/.config/QtProject/qtcreator/styles/darcula.xml

echo qtcreator-themed desktop file
rm ~/.local/share/applications/qtcreatorthemed.desktop
ln -s $RICE/qtcreatorthemed.desktop ~/.local/share/applications/qtcreatorthemed.desktop

echo qtcreator-themed script
rm ~/bin/qtcreatorthemed
ln -s $RICE/qtcreatorthemed ~/bin/qtcreatorthemed

echo kitty
rm -rf ~/.config/kitty
ln -s $RICE/kitty ~/.config/kitty

echo wayfire
rm ~/.config/wayfire.ini
ln -s $RICE/wayfire.ini ~/.config/

echo wallpaper setter
rm ~/bin/setwall
ln -s $RICE/setwall ~/bin/

echo "Installing /etc/issue"
sudo rm /etc/issue
sudo ln -s $RICE/issue /etc/issue

echo qutebrowser
mkdir -p ~/.config/qutebrowser
rm ~/.config/qutebrowser/config.py
ln -s $RICE/quteconfig.py ~/.config/qutebrowser/config.py

echo mpd.conf
mkdir -p ~/.config/mpd
rm ~/.config/mpd/mpd.conf
ln -s $RICE/mpd.conf ~/.config/mpd/mpd.conf

echo notify-at
ln -s $RICE/notify-at ~/bin

echo mako notifications
rm -rf ~/.config/mako
ln -s $RICE/mako ~/.config/mako
