local awful = require("awful")
local buttons = require'bindings.widgets.taglist'.buttons

return function(s)
   return awful.widget.taglist{
      screen = s,
			filter = function (t) return t.selected or #t:clients() > 0 end,
      buttons = buttons,
   }
end
