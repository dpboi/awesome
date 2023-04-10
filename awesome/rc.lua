-- load luarocks if installed
pcall(require, 'luarocks.loader')

-- load theme
local beautiful = require'beautiful'
local gears = require'gears'
local awful = require'awful'
beautiful.init('~/.config/awesome/themes/theme.lua')

-- load key and mouse bindings
require'bindings'

-- load rules
require'rules'

-- load signals
require'signals'

awful.spawn.with_shell("~/.config/awesome/scripts/run")
