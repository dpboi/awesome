local awful = require'awful'
local wibox = require'wibox'
local gears = require'gears'
local lain = require'lain'
local dpi = require("beautiful.xresources").apply_dpi
local apps = require'config.apps'
local mod = require'bindings.mod'

local taglist = require('widgets.wibar.tags')
local tasklist = require('widgets.wibar.task')
local textclock = require('widgets.wibar.clock')
local markup = lain.util.markup
local gray   = "#94928F"

-- FontAwesome
local function make_fa_icon( fa,bg,code )
  return wibox.widget{
    font = fa,
    markup = ' <span color="'.. bg ..'">' .. code .. '</span> ',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
end

-- Separators
local spr   = wibox.widget.textbox(' ')

local fatime = make_fa_icon('feather 10','#8ec07c', '\u{e939}')
local fampd = make_fa_icon('feather 10','#fb4934', '\u{e9a8}')
local famem = make_fa_icon('feather 10','#d3a498', '\u{e9b9}')
local fabatt = make_fa_icon('feather 10','#fe8019', '\u{e91c}')
local fabright = make_fa_icon('feather 10','#fabd2f', '\u{e9e3}')
local favol = make_fa_icon('feather 10','#83a598', '\u{ea0b}')
local fawifi = make_fa_icon('feather 10','#83a598', '\u{ea0e}')
local last = make_fa_icon('feather 10', '#1d2021', '\u{e9c0}')
local textclock = require('widgets.wibar.clock')

local volume = awful.widget.watch(".config/awesome/widgets/wibar/scripts/volume", 10)
local mem = awful.widget.watch(".config/awesome/widgets/wibar/scripts/mem", 1)
local mpd = awful.widget.watch(".config/awesome/widgets/wibar/scripts/mpd", 10)
local battery = awful.widget.watch(".config/awesome/widgets/wibar/scripts/battery", 10)
local wifi = awful.widget.watch(".config/awesome/widgets/wibar/scripts/wifi", 10)
local brightness = awful.widget.watch(".config/awesome/widgets/wibar/scripts/brightness", 10)

fampd:connect_signal("button::press",
    function()
        awful.spawn("alacritty -e ncmpcpp")
    end
)
fabright:connect_signal("button::press",
    function()
        awful.spawn("brillo -S 55")
    end
)
fawifi:connect_signal("button::press",
    function()
        awful.spawn("doas sv restart iwd")
    end
)
favol:connect_signal("button::press",
    function()
        awful.spawn("pavucontrol")
    end
)
last:connect_signal("button::press",
    function()
        awful.spawn("rofi -no-config -no-lazy-grab -theme ~/.config/awesome/scripts/rofi/powermenu.rasi -show power-menu -modi power-menu:~/.config/awesome/scripts/powermenu")
    end
)

return function(s)
   return awful.wibar{
      height = dpi(30),
      widget = {
				 layout = wibox.layout.align.horizontal,
				 expand = "none",
				 {-- left widgets
						layout = wibox.layout.fixed.horizontal,
						spr,
						{
							 {
									{
										 {
												taglist(s),
												top    = 3,
												bottom = 3,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						}
				 },
				 {
						layout = wibox.layout.fixed.horizontal,
						{
							 {
									{
										 {
												fampd,
												right = -3,
												top    = 3.5,
												bottom = 4.5,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#1d2021",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						spr,
						{
							 {
									{
										 {
												mpd,
												right = 5,
												top    = 2,
												bottom = 2,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#1d2021",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
				 },
				 {-- right widgets
						layout = wibox.layout.fixed.horizontal,
						spr,
						{
							 {
									{
										 {
												famem,
												right = -4,
												top    = 3,
												bottom = 4.5,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						{
							 {
									{
										 {
												mem,
												right = 5,
												top    = 2,
												bottom = 2,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						spr,
						{
							 {
									{
										 {
												fabright,
												right = -4,
												top    = 3,
												bottom = 4.5,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						{
							 {
									{
										 {
												brightness,
												right = 7,
												top    = 2,
												bottom = 2,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						spr,
						{
							 {
									{
										 {
												favol,
												right = -4,
												top    = 3,
												bottom = 4.5,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						{
							 {
									{
										 {
												volume,
												right = 5,
												top    = 2,
												bottom = 2,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						spr,
						{
							 {
									{
										 {
												fabatt,
												right = -4,
												top    = 3,
												bottom = 4.5,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						{
							 {
									{
										 {
												battery,
												right = 5,
												top    = 2,
												bottom = 2,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
						spr,
						{
							 {
									{
										 {
												fawifi,
												right = -4,
												top    = 3,
												bottom = 4.5,
												widget = wibox.container.margin
										 },
										 shape              = gears.shape.rectangle,
										 bg                 = "#282828",
										 widget             = wibox.container.background
									},
									layout  = wibox.layout.fixed.vertical
							 },
							 halign = "center",
							 valign = "center",
							 widget = wibox.container.place
						},
	       {
						{
							 {
									{
										 wifi,
										 right = 6,
										 top    = 2,
										 bottom = 2,
										 widget = wibox.container.margin
									},
									shape              = gears.shape.rectangle,
									bg                 = "#282828",
									widget             = wibox.container.background
							 },
							 layout  = wibox.layout.fixed.vertical
						},
						halign = "center",
						valign = "center",
						widget = wibox.container.place
	       },
	       spr,
	       {
						{
							 {
									{
										 fatime,
										 right = -4,
										 top    = 3,
										 bottom = 4.5,
										 widget = wibox.container.margin
									},
									shape              = gears.shape.rectangle,
									bg                 = "#282828",
									widget             = wibox.container.background
							 },
							 layout  = wibox.layout.fixed.vertical
						},
						halign = "center",
						valign = "center",
						widget = wibox.container.place
	       },
	       {
						{
							 {
									{
										 textclock(),
										 left   = 2,
										 right  = 7,
										 top    = 2,
										 bottom = 2,
										 widget = wibox.container.margin
									},
									shape              = gears.shape.rectangle,
									bg                 = "#282828",
									widget             = wibox.container.background
							 },
							 layout  = wibox.layout.fixed.vertical
						},
						halign = "center",
						valign = "center",
						widget = wibox.container.place
	       },
	       spr,
	       {
						{
							 {
									{
										 last,
										 top    = 3,
										 bottom = 4.5,
										 widget = wibox.container.margin
									},
									shape              = gears.shape.rectangle,
									bg                 = "#689d6a",
									widget             = wibox.container.background
							 },
							 layout  = wibox.layout.fixed.vertical
						},
						halign = "center",
						valign = "center",
						widget = wibox.container.place
	       },
				 spr,
	       wibox.widget.systray(),
				 }
			},
   }
end
