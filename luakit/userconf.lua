local luakit = require "luakit"
local select = require "select"
local adblock = require "adblock"
local follow = require "follow"
local editor = require "editor"
local modes = require "modes"

require_web_module("referer_control_wm")

local vertical_tabs = require "vertical_tabs"

select.label_maker = function()
    local chars = charset("qwerasdzxc")
    return trim(sort(reverse(chars)))
end
follow.pattern_maker = follow.pattern_styles.match_label


adblock.load(true, ".config/easylist.txt", false)

editor.editor_cmd = "kitty kak {file} +{line}"

modes.add_binds("normal", {
    {"<F1>", "Open in MPV", function(w) luakit.spawn("mpv '" .. w.view.uri .. "'") end}
})
