local awful = require'awful'
local ruled = require'ruled'

ruled.client.connect_signal('request::rules', function()
   -- All clients will match this rule.
   ruled.client.append_rule{
      id         = 'global',
      rule       = {},
      properties = {
	 size_hints_honor = false,
         focus     = awful.client.focus.filter,
         raise     = true,
         screen    = awful.screen.preferred,
         placement = awful.placement.no_overlap + awful.placement.no_offscreen
      }
   }

   -- Floating clients.
   ruled.client.append_rule{
      id = 'floating',
      rule_any = {
         instance = {'copyq', 'pinentry'},
         class = {
            'Sxiv',
            'veromix',
            'xtightvncviewer',
         },
         -- Note that the name property shown in xprop might be set slightly after creation of the client
         -- and the name shown there might not match defined rules here.
         name = {
            'Event Tester',  -- xev.
         },
         role = {
            'AlarmWindow',    -- Thunderbird's calendar.
            'ConfigManager',  -- Thunderbird's about:config.
            'pop-up',         -- e.g. Google Chrome's (detached) Developer Tools.
         }
      },
      properties = {floating = true}
   }

   -- Set Firefox to always map on the tag named '2' on screen 1.
   ruled.client.append_rule {
      rule       = {class = 'qutebrowser'},
      properties = {screen = 1, tag = '2'}
   }
   
   ruled.client.append_rule {
      rule       = {class = 'emacs'},
      properties = {screen = 1, tag = '1'}
   }
   
   ruled.client.append_rule {
      rule       = {class = 'lf'},
      properties = {screen = 1, tag = '3'}
   }
   
end)
