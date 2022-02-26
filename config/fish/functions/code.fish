function code --wraps code
  # Rejoice, ye X-oppressed masses, for wayland cometh!
  setsid code-insiders --enable-features=UseOzonePlatform --ozone-platform=wayland $argv
end
