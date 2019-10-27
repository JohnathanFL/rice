#!/bin/sh

mkdir ~/.local/share/qutebrowser-containers/private
container=$(find ~/.local/share/qutebrowser-containers/ -maxdepth 1 -type d -printf "%f\n" | tail -n +2 | bemenu.sh --prompt "Container:")

if [ -z $container ]; then
  exit
fi

if [[ $container == private ]]; then
  QUTE_CONTAINER=$container setsid qutebrowser --temp-basedir --config-py $RICE/quteconfig.py&
else
  QUTE_CONTAINER=$container setsid qutebrowser --basedir ~/.local/share/qutebrowser-containers/$container --config-py $RICE/quteconfig.py&
fi
