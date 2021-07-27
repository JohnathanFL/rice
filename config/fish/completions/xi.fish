# function __fish_xi_search -a searchText
#   xbps-query -Rs "$searchText" | cut -d' ' -f2 | cut -d' ' -f1 | xargs -n1 xbps-uhelper getpkgname
# end

complete -c xi -f
complete -c xi -a '(__fish_print_xbps_packages)'
