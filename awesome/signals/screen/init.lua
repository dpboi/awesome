local awful = require'awful'
local beautiful = require'beautiful'
local wibox = require'wibox'

local vars = require'config.vars'
local widgets = require'widgets'

screen.connect_signal('request::wallpaper', function(s)
awful.wallpaper {
    screen = s,
    widget = {
         horizontal_fit_policy = "fit",
         vertical_fit_policy   = "fit",
         image                 = beautiful.wallpaper,
         widget                = wibox.widget.imagebox,
     },
}end)

screen.connect_signal('request::desktop_decoration', function(s)
   awful.tag(vars.tags, s, awful.layout.layouts[1])
   widgets.wibar(s)
end)
