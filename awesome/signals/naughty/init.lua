local naughty = require'naughty'
local beautiful = require'beautiful'
local dpi = require("beautiful.xresources").apply_dpi

naughty.connect_signal('request::display_error', function(message, startup)
   naughty.notification{
      urgency = 'critical',
      title = 'Oops, and error happened' .. (startup and ' during startup!' or '!'),
      message = message,
      margin = dpi(16),
      icon_size = dpi(360),
      position = 'top_middle',
   }
end)

naughty.config.defaults.ontop = true
naughty.config.padding = dpi(0)
naughty.config.spacing= dpi(0)
naughty.config.defaults.margin = dpi(10)
naughty.config.timeout = 3
naughty.config.defaults.border_width = 0
beautiful.notification_font = "JetBrainsMono Nerd Font 10"
beautiful.notification_icon_size = dpi(128)
beautiful.naughty_notification_fg = "#ebdbb2"
beautiful.naughty_notification_bg = "#1d2021"
