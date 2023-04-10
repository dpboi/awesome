local awful = require'awful'
local wibox = require'wibox'

return function()
   return wibox.widget{
      format = "%I:%M %P",
      halign = "center",
      valign = "center",
      widget = wibox.widget.textclock
   }
end
