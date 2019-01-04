#!/bin/sh

RICE=`pwd`

# zshrc
rm ~/.zshrc
ln -s $RICE/zshrc ~/.zshrc

# awesome configs
rm -rf ~/.config/awesome
ln -s `pwd`/awesome ~/.config/awesome

# qtcreator themes
mkdir -p ~/.config/QtProject/qtcreator/styles
rm ~/.config/QtProject/qtcreator/styles/darcula.xml
ln -s `pwd`/themes/Qt-Creator-Darcula/darcula.xml ~/.config/QtProject/qtcreator/styles/darcula.xml

