local awful = require("awful")
local ruled = require("ruled")
local naughty = require("naughty")

ruled.notification.connect_signal('request::rules', function()
--  Notifications timeout
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)
naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)
naughty.config.defaults['icon_size'] = 80
