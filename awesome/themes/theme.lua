local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}
theme.wallpaper = "~/data/Pictures/my-wallpapers/68.jpg"
theme.font      = "JetBrainsMono Nerd Font 9"

theme.fg_normal  = "#d5c4a1"
theme.fg_focus   = "#ebdbb2"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#1d2021"
theme.bg_focus   = "#282828"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal

theme.useless_gap   = dpi(15)
theme.border_width  = dpi(3)
theme.border_color_normal = "#282828"
theme.border_color_active = "#665c54"
theme.border_color_marked = "#CC9393"

theme.taglist_font = "feather 10"
theme.taglist_bg_focus = "#282828"
theme.taglist_bg_normal = "#282828"
theme.taglist_fg_occupied = "#fabd2f"
theme.taglist_fg_empty = "#ebdbb2"
theme.taglist_fg_focus = "#fb4934"

return theme
