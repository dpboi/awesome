-- {{{ Imports
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local beautiful = require("beautiful")
-- }}}

local themes_path = string.format("%s/.config/awesome/theme/", os.getenv("HOME"))
-- {{{ Main
local theme = {}
-- }}}

-- {{{ theme font
theme.font = "mononoki Nerd Font 10"
--- }}}

-- {{{ Colors
theme.fg_normal = "#d5c4a1"
theme.fg_focus  = "#d5c4a1"
theme.fg_urgent = "#a89984"
theme.bg_normal = "#282828"
theme.bg_focus  = "#282828"
theme.bg_urgent = "#a89984"
-- }}}

-- {{{ Bar
theme.bar_1 = "#458588"
theme.bar_2 = "#b16286"
theme.bar_3 = "#689d6a"
theme.bar_4 = "#d79921"
theme.bar_5 = "#98971a"
theme.bar_6 = "#d65d0e"
-- }}}


-- {{{ Borders
theme.useless_gap   = dpi(6)
theme.border_width  = dpi(2)
theme.border_normal = "#282828"
theme.border_focus  = "#cc241d"
theme.border_marked = "#cc241d"
-- }}}

-- {{{ Taglist
theme.taglist_font        = "mononoki Nerd Font Mono 20"
theme.taglist_fg_focus    = "#cc241d"
theme.taglist_fg_occupied = "#d79921"
theme.taglist_fg_urgent   = "#504945"
theme.taglist_fg_empty    = "#bdae93"
theme.taglist_spacing     = 10
-- }}}

-- {{{ Notifications
theme.notification_font         = "mononoki Nerd Font 12"
theme.notification_bg           = "#282828"
theme.notification_fg           = "#ebdbb2"
theme.notification_border_color = "#cc241d"
-- }}}

-- {{{ Hotkeys Popup
theme.hotkeys_bg               = "#282828"
theme.hotkeys_fg               = "#ebdbb2"
theme.hotkeys_modifiers_fg     = "#458588"
theme.hotkeys_label_bg         = "#fabd2f"
theme.hotkeys_label_fg         = "#1d2021"
theme.hotkeys_group_margin     = dpi(20)
theme.hotkeys_description_font = "mononoki Nerd Font Mono 12"
theme.hotkeys_font             = "mononoki Nerd Font Mono 12"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color   = "#cc241d"
theme.mouse_finder_radius  = dpi(5)
theme.mouse_finder_timeout = 10
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "layouts/tile.png"
theme.layout_tileleft   = themes_path .. "layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "layouts/fairv.png"
theme.layout_fairh      = themes_path .. "layouts/fairh.png"
theme.layout_spiral     = themes_path .. "layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "layouts/dwindle.png"
theme.layout_max        = themes_path .. "layouts/max.png"
theme.layout_fullscreen = themes_path .. "layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "layouts/magnifier.png"
theme.layout_floating   = themes_path .. "layouts/floating.png"
theme.layout_cornernw   = themes_path .. "layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "layouts/cornerse.png"
-- }}}

return theme

