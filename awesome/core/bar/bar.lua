local wibox = require("wibox")
local awful = require("awful")
local theme = require("theme.theme")

-- Textclock widget
mytextclock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
  -- Tag names for each screen
  awful.tag({ "",
    "",
    "爵",
    "",
    "",
    "",
    ""
  }, s, awful.layout.layouts[1])

  -- Custom widgets
  s.volume = awful.widget.watch(".config/awesome/core/bar/widgets/volume", 1)
  s.battery = awful.widget.watch(".config/awesome/core/bar/widgets/battery", 10)
  s.wifi = awful.widget.watch(".config/awesome/core/bar/widgets/wifi", 10)
  s.brightness = awful.widget.watch(".config/awesome/core/bar/widgets/brightness", 1)
  s.layout = awful.widget.watch(".config/awesome/core/bar/widgets/layout", 1)

  --  Taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t) t:view_only() end),
      awful.button({ modkey }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
      awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end),
    }
  }
 
  --  Wibox
  s.mywibox = awful.wibar {
    position = "top",
    screen   = s,
    widget   = {
      layout = wibox.layout.stack,
      {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
	  layout = wibox.layout.fixed.horizontal,
          wibox.widget.background(wibox.widget.textbox("  "), theme.bg_normal),
          wibox.container.background(mytextclock, theme.bg_normal),
          wibox.widget.textbox(" "),
	},
        nil,
        { -- Right widgets
          layout = wibox.layout.fixed.horizontal,
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(s.volume, theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(s.brightness, theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(s.battery, theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(s.wifi, theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(" "), theme.bg_normal),
          wibox.container.background(wibox.widget.textbox(""), theme.bg_normal),
        },
      },
      {
        s.mytaglist,
        valign = "center",
        halign = "center",
        layout = wibox.container.place,
      }

    }
  }
end)
