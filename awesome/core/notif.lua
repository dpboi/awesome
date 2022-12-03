local awful = require("awful")
local ruled = require("ruled")
local naughty = require("naughty")
local beautiful = require("beautiful")

naughty.config.defaults.ontop = true
naughty.config.padding = 10
naughty.config.spacing= 10
naughty.config.defaults.margin = 10
naughty.config.defaults.timeout = 3
naughty.config.defaults.border_width = 5
beautiful.notification_font = "mononoki Nerd Font"
beautiful.notification_icon_size = 128
beautiful.notification_opacity = 0.85
