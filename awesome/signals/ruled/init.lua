local awful = require'awful'
local ruled = require'ruled'
local naughty = require'naughty'
local wibox = require'wibox'
local beautiful = require'beautiful'

ruled.notification.connect_signal('request::rules', function()
   -- All notifications will match this rule.
   ruled.notification.append_rule {
      rule       = {},
      properties = {
				 screen = awful.screen.preferred,
				 implicit_timeout = 13,
				 widget_template = {
						{
							 {
									{
										 naughty.widget.icon,
										 halign        = "left",
										 valign        = "left",
										 widget        = wibox.container.place
									},
									{
										 halign = "center",
										 widget = naughty.widget.title,
									},
									{
										 halign = "center",
										 widget = naughty.widget.message,
										 },
									spacing = 20,
									layout  = wibox.layout.fixed.horizontal,
							 },
							 margins = beautiful.notification_margin,
							 widget  = wibox.container.margin,
						},
						forced_height = 130,
						forced_width = 350,
						widget = naughty.container.background,
				 },
			}
	 }
end)

naughty.connect_signal("request::display", function(n)
	naughty.layout.box {
	   notification = n,
	}
end)

