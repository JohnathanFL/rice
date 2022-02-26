function xr --wraps xbps-remove
    if test (id -u) = 0
      xbps-remove $argv
    else
      sudo xbps-remove $argv
    end
end
