local awful = require("awful")
local ruled = require("ruled")

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id         = "global",
    rule       = {},
    properties = {
      size_hints_honor = false,
      focus            = awful.client.focus.filter,
      raise            = true,
      screen           = awful.screen.preferred,
      placement        = awful.placement.no_overlap + awful.placement.no_offscreen,
      callback         = awful.client.setslave
    }
  }

  -- Floating clients.
  ruled.client.append_rule {
    id         = "floating",
    rule_any   = {
      instance = { "copyq", "pinentry" },
      class    = {
        "Galculator",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name     = {
        "Event Tester", -- xev.
      },
      role     = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  }

  -- TAG 1
  ruled.client.append_rule {
    rule_any = { class = {
      "Emacs",
      "nvim"
    }
    },
    properties = { tag = "" },
  }
  -- TAG 2
  ruled.client.append_rule {
    rule = { class = "lf" },
    properties = { tag = "" },
  }
  -- TAG 3
  ruled.client.append_rule {
    rule_any = { class = {
      "Brave-browser",
      "Firefox",
      "qutebrowser"
    }
    },
    properties = { tag = "爵" }
  }
  -- TAG 4
  ruled.client.append_rule {
    rule = { class = "calibre" },
    properties = { tag = "" }
  }
  -- TAG 5
  ruled.client.append_rule {
    rule_any = { class = {
      "ncmpcpp",
      "mpv";
    }
    },
    properties = { tag = "" }
  }
  -- TAG 6
  ruled.client.append_rule {
    rule_any = { class = {
      "kdenlive",
      "Blender",
      "Natron",
      "SimpleScreenRecorder",
      "Ghb",
      "obs",
      "mpv"
    }
    },
    properties = { tag = "" }
  }
  -- TAG 7
  ruled.client.append_rule {
    rule_any = { class = {
      "Qjackctl",
      "lsp-plugins",
      "qpwgraph",
      "Gimp-2.10",
      "krita",
      "Inkscape",
      "Xournalpp",
    }
    },
    properties = { tag = "" }
  }
  -- TAG 8
  ruled.client.append_rule {
    rule_any = { class = {
      "DesktopEditors",
      "libreoffice.*",
      "Joplin"
    },
      instance = {
        "libreoffice.*"
      },
      name = {
        "libreoffice.*"
      }
    },
    properties = { tag = "" }
  }
  -- }
end)
