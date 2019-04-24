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

# waybar
rm -rf ~/.config/waybar
ln -s $RICE/waybar ~/.config/waybar

# launcher
rm ~/bin/launcher.sh
ln -s $RICE/launcher.sh ~/bin/launcher.sh

cd desktop_parser
nimble build
mv desktop_parser ../parse_desktops
cd ..

# qtcreator themes
mkdir -p ~/.config/QtProject/qtcreator/styles
rm ~/.config/QtProject/qtcreator/styles/darcula.xml
ln -s $RICE/themes/Qt-Creator-Darcula/darcula.xml ~/.config/QtProject/qtcreator/styles/darcula.xml

# qtcreator-themed desktop file
rm ~/.local/share/applications/qtcreatorthemed.desktop
ln -s $RICE/qtcreatorthemed.desktop ~/.local/share/applications/qtcreatorthemed.desktop

# qtcreator-themed script
rm ~/bin/qtcreatorthemed
ln -s $RICE/qtcreatorthemed ~/bin/qtcreatorthemed

# alacritty
rm -rf ~/.config/alacritty
ln -s $RICE/alacritty/ ~/.config/alacritty
# and termite, for good measure
rm -rf ~/.config/termite
ln -s $RICE/termite ~/.config/termite

# wayfire
rm ~/.config/wayfire.ini
ln -s $RICE/wayfire.ini ~/.config/

# wallpaper setter
rm ~/bin/setwall
ln -s $RICE/setwall ~/bin/

echo "Installing /etc/issue"
sudo ln -s $RICE/issue /etc/issue
