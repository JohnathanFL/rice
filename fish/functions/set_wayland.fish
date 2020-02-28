function set_wayland -d "Turn wayland variables on or off"
  if [ $argv = 'on' ]
  	set -x QT_QPA_PLATFORM wayland
  	set -x QT_WAYLAND_FORCE_DPI logical
  	set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
  	set -x GDK_BACKEND wayland
  	set -x SDL_VIDEODRIVER wayland
  	set -x _JAVA_AWT_WM_NONREPARENTING 1
  	echo "Wayland enabled"
  else
  	set -x QT_QPA_PLATFORM xcb
  	set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
  	set -x GDK_BACKEND x11
  	set -x SDL_VIDEODRIVER x11
  	echo "Wayland disabled"
  end
end
