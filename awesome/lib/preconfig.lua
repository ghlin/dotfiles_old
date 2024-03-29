local beautiful = require 'beautiful'
local awful     = require 'awful'
awful.rules     = require 'awful.rules'
local _         = require 'awful.autofocus'


local theme = os.getenv 'AWESOME_THEME' or 'numix'

beautiful.init(awful.util.getdir 'config'  .. '/themes/' .. theme .. '/theme.lua')

-- {{{ Variables
terminal   = 'terminator'
editor     = os.getenv 'EDITOR'  or 'vim'
modkey     = 'Mod4'
altkey     = 'Mod1'
-- }}}

-- {{{ Naughty presets
local naughty   = require 'naughty'

naughty.config.defaults.timeout       = 5
naughty.config.defaults.screen        = 1
naughty.config.defaults.position      = 'top_right'
naughty.config.defaults.margin        = 12
naughty.config.defaults.gap           = 1
naughty.config.defaults.ontop         = true
naughty.config.defaults.font          = 'envypn 9'
naughty.config.defaults.icon          = beautiful.naughty
naughty.config.defaults.icon_size     = 256
naughty.config.defaults.fg            = fg_tooltip
naughty.config.defaults.bg            = bg_tooltip
naughty.config.defaults.border_color  = border_tooltip
naughty.config.defaults.border_width  = 0
naughty.config.defaults.hover_timeout = nil
-- }}}

return {}

