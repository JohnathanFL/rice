#!/bin/sh

RICE=`pwd`

# zshrc
rm ~/.zshrc
ln -s $RICE/zshrc ~/.zshrc

# awesome configs
rm -rf ~/.config/awesome
ln -s $RICE/awesome ~/.config/awesome

# sway configs
rm -rf ~/.config/sway
ln -s $RICE/sway ~/.config/sway

# launcher
rm ~/bin/launcher.sh
ln -s $RICE/launcher.sh ~/bin/launcher.sh

# qtcreator themes
mkdir -p ~/.config/QtProject/qtcreator/styles
rm ~/.config/QtProject/qtcreator/styles/darcula.xml
ln -s $RICE/themes/Qt-Creator-Darcula/darcula.xml ~/.config/QtProject/qtcreator/styles/darcula.xml

# qtcreator-themed desktop file
rm ~/.local/share/applications/qtcreatorthemed.desktop
ln -s $RICE/qtcreatorthemed.desktop ~/.local/share/applications/qtcreatorthemed.desktop
