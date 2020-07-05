function insurgency
  cd /mnt/ssd/Steam/steamapps/common/insurgency2/
  set_wayland off
  LD_PRELOAD='/usr/$LIB/libstdc++.so.6:/usr/$LIB/libgcc_s.so.1:/usr/$LIB/libxcb.so.1:/usr/$LIB/libgpg-error.so' setsid ./insurgency.sh
end
