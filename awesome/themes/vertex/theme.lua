local awful     = require 'awful'

-- {{{ Main
theme                       = {}
theme.wallpaper             = os.getenv 'AWESOME_BG' or os.getenv 'HOME' .. '/Pictures/air.jpg'
theme.font                  = 'ProFont 8'
theme.tasklist_disable_icon = true
-- }}}

-- {{{ Colors
theme.fg_tooltip    = '#dedede'

theme.fg_em         = '#dedede'

theme.bg_normal     = '#454749'
theme.bg_focus      = '#454749'
theme.bg_urgent     = '#ff0000'
theme.bg_minimize   = '#454749'

theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#dedede'
theme.fg_focus      = '#d63937'
theme.fg_urgent     = '#ff0000'
theme.fg_minimize   = '#eeeeee'

theme.border_width  = '0'
theme.border_normal = '#000000'
theme.border_focus  = '#454749'
theme.border_marked = '#91231c'

-- }}}

-- {{{ Menu
theme.menu_height   = 15
theme.menu_width    = 150
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel   = awful.util.getdir 'config'  .. '/themes/shared/icons/square_a.png'
theme.taglist_squares_unsel = awful.util.getdir 'config'  .. '/themes/shared/icons/square_b.png'
-- }}}

-- {{{ Misc
theme.awesome_icon          = awful.util.getdir 'config'  .. '/themes/shared/icons/start-here.svg'
theme.menu_submenu_icon     = awful.util.getdir 'config'  .. '/themes/shared/icons/submenu.png'
theme.uptime                = awful.util.getdir 'config'  .. '/themes/shared/icons/uptime.png'
theme.clock                 = awful.util.getdir 'config'  .. '/themes/shared/icons/clock.png'
theme.volume                = awful.util.getdir 'config'  .. '/themes/shared/icons/volume.png'
theme.music                 = awful.util.getdir 'config'  .. '/themes/shared/icons/music.png'
theme.battery               = awful.util.getdir 'config'  .. '/themes/shared/icons/battery.png'
theme.arrl                  = awful.util.getdir 'config'  .. '/themes/shared/icons/arrl.png'
theme.arrr                  = awful.util.getdir 'config'  .. '/themes/shared/icons/arrr.png'
theme.thunar                = awful.util.getdir 'config'  .. '/themes/shared/icons/thunar.svg'
theme.browser               = awful.util.getdir 'config'  .. '/themes/shared/icons/browser.svg'
theme.terminal              = awful.util.getdir 'config'  .. '/themes/shared/icons/terminal.svg'
theme.text_editor           = awful.util.getdir 'config'  .. '/themes/shared/icons/text-editor.svg'
theme.audio_player          = awful.util.getdir 'config'  .. '/themes/shared/icons/audioplayer.svg'
theme.naughty               = awful.util.getdir 'config'  .. '/themes/shared/icons/naughty.svg'
-- }}}

-- {{{ Layout
theme.layout_tile       = awful.util.getdir 'config' .. '/themes/shared/icons/tile.png'
theme.layout_tileleft   = awful.util.getdir 'config' .. '/themes/shared/icons/tileleft.png'
theme.layout_tilebottom = awful.util.getdir 'config' .. '/themes/shared/icons/tilebottom.png'
theme.layout_tiletop    = awful.util.getdir 'config' .. '/themes/shared/icons/tiletop.png'
theme.layout_fairv      = awful.util.getdir 'config' .. '/themes/shared/icons/fairv.png'
theme.layout_fairh      = awful.util.getdir 'config' .. '/themes/shared/icons/fairh.png'
theme.layout_spiral     = awful.util.getdir 'config' .. '/themes/shared/icons/spiral.png'
theme.layout_dwindle    = awful.util.getdir 'config' .. '/themes/shared/icons/dwindle.png'
theme.layout_max        = awful.util.getdir 'config' .. '/themes/shared/icons/max.png'
theme.layout_fullscreen = awful.util.getdir 'config' .. '/themes/shared/icons/fullscreen.png'
theme.layout_magnifier  = awful.util.getdir 'config' .. '/themes/shared/icons/magnifier.png'
theme.layout_floating   = awful.util.getdir 'config' .. '/themes/shared/icons/floating.png'
-- }}}

return theme

