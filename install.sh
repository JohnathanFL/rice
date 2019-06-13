#!/bin/sh

RICE=`pwd`

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

echo termite
rm -rf ~/.config/termite
ln -s $RICE/termite ~/.config/termite

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
