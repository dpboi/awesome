local awful = require'awful'
require'awful.autofocus'
local wibox = require'wibox'

client.connect_signal('mouse::enter', function(c)
   c:activate{context = 'mouse_enter', raise = false}
end)
