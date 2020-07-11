--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

mon = {}
mon.black = "#272822"
mon.white = "#f8f8f2"
mon.grey = "#74715e"
mon.red = "#F92672"
mon.blue = "#66D9EF"
mon.green = "#A6E22E"
mon.orange = "#FD971F"
mon.purple = "#ae81ff"
mon.yellow = "#e6db74"

-- Default settings
theme.font = "12px monospace"
theme.fg   = mon.white
theme.bg   = mon.black

-- Genaral colours
theme.success_fg = mon.green
theme.loaded_fg  = mon.green
theme.error_fg = mon.red
theme.error_bg = mon.purple

-- Warning colours
theme.warning_fg = mon.red
theme.warning_bg = mon.black

-- Notification colours
theme.notif_fg = mon.red
theme.notif_bg = mon.white

-- Menu colours
theme.menu_fg                   = mon.white
theme.menu_bg                   = mon.black
theme.menu_selected_fg          = mon.white
theme.menu_selected_bg          = mon.purple
theme.menu_title_bg             = mon.red
theme.menu_primary_title_fg     = mon.white
theme.menu_secondary_title_fg   = mon.white

theme.menu_disabled_fg = "#999"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#060"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = mon.white
theme.sbar_bg         = mon.black

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = "#000"
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = "#000"
theme.ibar_bg           = "rgba(0,0,0,0)"

-- Tab label
theme.tab_fg            = "#fff"
theme.tab_bg            = mon.black
theme.tab_hover_bg      = "#292929"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#fff"
-- Will be set programmatically based on container, eventually
theme.selected_bg       = "#000"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = "#000"

theme.selected_private_tab_bg = "#3d295b"
theme.private_tab_bg    = "#22254a"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#F00"

-- Follow mode hints
theme.hint_font = "10px monospace, courier, sans-serif"
theme.hint_fg = "#fff"
theme.hint_bg = "#000088"
theme.hint_border = "1px dashed #000"
theme.hint_overlay_bg = "rgba(255,255,153,0.3)"
theme.hint_overlay_border = "1px dotted #000"
theme.hint_overlay_selected_bg = "rgba(0,255,0,0.3)"
theme.hint_overlay_selected_border = theme.hint_overlay_border

-- General colour pairings
theme.ok = { fg = "#000", bg = "#FFF" }
theme.warn = { fg = "#F00", bg = "#FFF" }
theme.error = { fg = "#FFF", bg = "#F00" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
