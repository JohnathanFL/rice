#!/bin/sh

RICE=$(pwd)

dry=true
if [ "$1" = "--install" ]; then
  dry=false
else
  echo "Dry run. Run again with --install to actually install things"
fi

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
# Really just a thin wrapper over ensureDir that ensures $2's dirname exists,
# then links $1 as $2
installAs() {
  srcFilename="$(basename "$1")"
  destDir="$(dirname "$2")"
  destName="$(basename "$2")"
  printf "  Installing %-22s to %-40s as %s\n" "$srcFilename" "$destDir" "$destName"
  if ! $dry; then
    ensureDir "$destDir"
    ln -sfT "$1" "$destDir/$destName"
  fi
}

# `install a/b/c d/` creates `d/b/c`, where b is a dir and `d/b/c` points to `a/b/c`
install() {
  filename="$(basename "$1")"
  printf "  Installing %-22s to %s\n" "$filename" "$2"
  if ! $dry; then
    ensureDir "$2"
    rm -rf "$2/$filename"
    ln -sfT "$1" "$2/$filename"
  fi
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

echo "Installing bin stuff..."
for file in $RICE/bin/* ; do
  install "$file" ~/bin/
done

echo "Installing homedir dots..."
for file in $RICE/home-dots/* ; do
  name="$(basename "$file")"
  installAs "$file" "$HOME/"."$name"
done

echo "Installing .config stuff..."
for file in $RICE/config/* ; do
  install "$file" ~/.config
done

installAs $RICE/quteconfig.py         ~/.config/qutebrowser/config.py


echo "/etc/issue requires manual installation"
