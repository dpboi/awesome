local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup");
require("awful.hotkeys_popup.keys")
local apps = require("core.apps")
require("awful.autofocus")

-- Modkeys.
altkey = "Mod1"
modkey = "Mod4"
conkey = "Control"

--[[ Quick keybindings ]] --
awful.keyboard.append_global_keybindings({
  -- Show all the keybindings
  awful.key({ modkey }, "s", hotkeys_popup.show_help,
    { description = "show help", group = "quick" }),
  -- Reload awesome
  awful.key({ modkey, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "quick" }),
  -- Show/Hide Wibox
  awful.key({ modkey }, "b", function()
    for s in screen do
      s.mywibox.visible = not s.mywibox.visible
      if s.mybottomwibox then
        s.mybottomwibox.visible = not s.mybottomwibox.visible
      end
    end
  end,
    { description = "toggle wibox", group = "quick" }),
  awful.key({ modkey }, "Return", function() awful.spawn(apps.terminal) end,
    { description = "open a terminal", group = "launcher" }),
})
--[[ ]] --

--[[ Tags related keybindings ]] --
awful.keyboard.append_global_keybindings({
  -- Switch to previous tag
  awful.key({ modkey }, "Left", awful.tag.viewprev,
    { description = "view previous", group = "tag" }),
  -- Switch to next tag
  awful.key({ modkey }, "Right", awful.tag.viewnext,
    { description = "view next", group = "tag" }),
  -- Switch back to the previous tag
  awful.key({ modkey }, "Escape", awful.tag.history.restore,
    { description = "go back", group = "tag" }),
  -- Switch tags by numbers 1-9
  awful.key {
    modifiers   = { modkey },
    keygroup    = "numrow",
    description = "only view tag",
    group       = "tag",
    on_press    = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
  -- Toggle tags by numbers 1-9
  awful.key {
    modifiers   = { modkey, "Control" },
    keygroup    = "numrow",
    description = "toggle tag",
    group       = "tag",
    on_press    = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
  },
  -- Move focused client to tag by numbers 1-9
  awful.key {
    modifiers   = { modkey, "Shift" },
    keygroup    = "numrow",
    description = "move focused client to tag",
    group       = "tag",
    on_press    = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
  -- Toggle focused client on tag by numbers 1-9
  awful.key {
    modifiers   = { modkey, "Control", "Shift" },
    keygroup    = "numrow",
    description = "toggle focused client on tag",
    group       = "tag",
    on_press    = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  },
})
--[[ ]] --

--[[ Focus related keybindings ]] --
awful.keyboard.append_global_keybindings({
  -- Focus next client by index
  awful.key({ modkey }, "j",
    function()
      awful.client.focus.byidx(1)
    end,
    { description = "focus next by index", group = "focus" }),
  -- Focus previous client by index
  awful.key({ modkey }, "k",
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous by index", group = "focus" }),
  -- Focus last focused client
  awful.key({ modkey }, "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = "go back", group = "focus" }),
  -- Focus next screen
  awful.key({ modkey, "Control" }, "j", function() awful.screen.focus_relative(1) end,
    { description = "focus the next screen", group = "focus" }),
  -- Focus previous screen
  awful.key({ modkey, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "focus" }),
})
--[[ ]] --

--[[ Layout related keybindings ]] --
awful.keyboard.append_global_keybindings({
  -- Swap with next client by index
  awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "layout" }),
  -- Swap with previous client by index
  awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "layout" }),
  -- Increase master width
  awful.key({ modkey }, "l", function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "layout" }),
  -- Decrease master width
  awful.key({ modkey }, "h", function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }),
  -- Increase the number of master clients
  awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }),
  -- Decrease the number of master clients
  awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }),
  -- Increase the number of columns
  awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }),
  -- Decrease the number of columns
  awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }),
  -- Switch to next layout
  awful.key({ modkey }, "space", function() awful.layout.inc(1) end,
    { description = "select next", group = "layout" }),
  -- Switch to previous layout
  awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }),
  -- Select layouts directly
  awful.key {
    modifiers   = { modkey },
    keygroup    = "numpad",
    description = "select layout directly",
    group       = "layout",
    on_press    = function(index)
      local t = awful.screen.focused().selected_tag
      if t then
        t.layout = t.layouts[index] or t.layout
      end
    end,
  }
})
--[[ ]] --


--[[ Client related keybindings ]] --
client.connect_signal("request::default_keybindings", function()
  -- Mouse bindings
  awful.mouse.append_client_mousebindings({
    -- Focus client with left click
    awful.button({}, 1, function(c)
      c:activate { context = "mouse_click" }
    end),
    -- Move client by MODKEY + mouse left click
    awful.button({ modkey }, 1, function(c)
      c:activate { context = "mouse_click", action = "mouse_move" }
    end),
    -- Resize client by MODKEY + mouse right click
    awful.button({ modkey }, 3, function(c)
      c:activate { context = "mouse_click", action = "mouse_resize" }
    end),
  })
  -- Keyboard bindings
  awful.keyboard.append_client_keybindings({
    -- Set focused client to fullscreen
    awful.key({ modkey }, "f",
      function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
      { description = "toggle fullscreen", group = "client" }),
    -- Close focused client
    awful.key({ modkey }, "q", function(c) c:kill() end,
      { description = "close", group = "client" }),
    -- Toggle floating mode on focused client
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
      { description = "toggle floating", group = "client" }),
    -- Move focused client to master
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
      { description = "move to master", group = "client" }),
    -- Move focused client to the other screen
    awful.key({ modkey }, "o", function(c) c:move_to_screen() end,
      { description = "move to screen", group = "client" }),
    -- Toggle focused client to be on top
    awful.key({ modkey }, "t", function(c) c.ontop = not c.ontop end,
      { description = "toggle keep on top", group = "client" }),
    -- Minimize focused client
    awful.key({ modkey }, "n", function(c) c.minimized = true end,
      { description = "minimize", group = "client" }),
    -- (Un)Maximize focused client
    awful.key({ modkey }, "m",
      function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
      { description = "(un)maximize", group = "client" }),
    -- (Un)Maximize vertically focused client
    awful.key({ modkey, "Control" }, "m",
      function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end,
      { description = "(un)maximize vertically", group = "client" }),
    -- (Un)Maximize horizontally focused client
    awful.key({ modkey, "Shift" }, "m",
      function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end,
      { description = "(un)maximize horizontally", group = "client" }),
    -- Unminimize clients
    awful.key({ modkey, "Control" }, "n",
      function()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          c:emit_signal(
            "request::activate", "key.unminimize", { raise = true }
          )
        end
      end,
      { description = "restore minimized", group = "client" }),
  })
end)
--[[ ]] --

--[[ Custom keybindings ]]
awful.keyboard.append_global_keybindings({
  -- Volume
  awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("pamixer -i 5") end,
    { description = "increase volume", group = "quick" }),
  awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("pamixer -d 5") end,
    { description = "decrease volume", group = "quick" }),
  awful.key({}, "XF86AudioMute", function() awful.spawn("pamixer -t") end,
    { description = "mute volume", group = "quick" }),
  awful.key({}, "XF86AudioMicMute", function() awful.spawn("pamixer --default-source -t") end,
    { description = "mute microphone", group = "quick" }),
  -- Media
  awful.key({}, "XF86AudioPlay", function() awful.spawn("mpc toggle") end,
    { description = "pause/play", group = "quick" }),
  awful.key({}, "XF86AudioNext", function() awful.spawn("mpc next") end,
    { description = "Next", group = "quick" }),
  awful.key({}, "XF86AudioPrev", function() awful.spawn("mpc prev") end,
    { description = "previous", group = "quick" }),
  -- Brightness
  awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("light -A 5") end,
    { description = "increase brightness", group = "quick" }),
  awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("light -U 5") end,
    { description = "decrease brightness", group = "quick" }),
  -- apps (Super + a followed by KEY)
  awful.key({ modkey }, "a", function()
    local grabber
    grabber =
    awful.keygrabber.run(
      function(_, key, event)
        if event == "release" then return end
        if key == "1" then awful.util.spawn(apps.editor)
        elseif key == "2" then awful.util.spawn(apps.file)
        elseif key == "3" then awful.util.spawn(apps.browser)
        elseif key == "5" then awful.util.spawn(apps.music)
        end
        awful.keygrabber.stop(grabber)
      end
    )
  end,
    { description = "followed by KEY", group = "apps" }
  ),
  -- Dmenu scripts (Super + p followed by KEY)
  awful.key({ modkey }, "p", function()
    local grabber
    grabber =
    awful.keygrabber.run(
      function(_, key, event)
        if event == "release" then return end
        if key == "d" then awful.spawn.with_shell("rofi -show drun -show-icons")
        elseif key == "r" then awful.spawn.with_shell("rofi -show run")
        elseif key == "q" then awful.spawn.with_shell("$HOME/.config/rofi/scripts/rofi_power")
        elseif key == "i" then awful.spawn.with_shell("$HOME/.config/rofi/scripts/rofi_wifi")
        elseif key == "b" then awful.spawn.with_shell("$HOME/.config/rofi/scripts/rofi_blue")
        elseif key == "s" then awful.spawn.with_shell("$HOME/.config/rofi/scripts/rofi_scrot")
        end
        awful.keygrabber.stop(grabber)
      end
    )
  end,
    { description = "followed by KEY", group = "dmenu scripts" }
  ),
})
--[[ ]]

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
