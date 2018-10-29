#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run cbatticon
run feh --bg-scale ~/Pictures/Wizardcats.jpg
