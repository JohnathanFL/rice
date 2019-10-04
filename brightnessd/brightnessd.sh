#!/bin/sh

increase() {
  echo Increasing
  echo "$(cat /sys/class/backlight/intel_backlight/brightness) + 100" | bc | tee /sys/class/backlight/intel_backlight/brightness
}


decrease() {
  echo Decreasing
  echo "$(cat /sys/class/backlight/intel_backlight/brightness) - 100" | bc | tee /sys/class/backlight/intel_backlight/brightness
}

mkfifo /tmp/brightnessd.fifo
chmod o+w /tmp/brightnessd.fifo

while true; do
  read IN < /tmp/brightnessd.fifo
  case $IN in
    + )
      increase
      ;;
    -- )
      decrease
      ;;
    * )
      ;;
  esac
done


rm /tmp/brightnessd.fifo
