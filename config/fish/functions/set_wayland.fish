function set_wayland -d "Turn wayland variables on or off"
  if [ $argv = 'on' ]
  	set -xg QT_QPA_PLATFORM wayland
  	set -xg QT_WAYLAND_FORCE_DPI logical
  	set -xg QT_WAYLAND_DISABLE_WINDOWDECORATION 1
  	set -xg GDK_BACKEND wayland
  	set -xg SDL_VIDEODRIVER wayland
  	set -xg _JAVA_AWT_WM_NONREPARENTING 1
  	echo "Wayland enabled"
  else
  	set -xg QT_QPA_PLATFORM xcb
  	set -xg QT_WAYLAND_DISABLE_WINDOWDECORATION 1
  	set -xg GDK_BACKEND x11
  	set -xg SDL_VIDEODRIVER x11
  	echo "Wayland disabled"
  end
end
