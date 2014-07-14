local awful     = require 'awful'

-- {{{ Main
theme                       = {}
theme.wallpaper             = os.getenv 'AWESOME_BG' or os.getenv 'HOME' .. '/Pictures/air.jpg'
theme.font                  = 'Terminus 8'
theme.tasklist_disable_icon = true
-- }}}

-- {{{ Colors
theme.fg_tooltip    = '#2d2d2d55'

theme.fg_em         = '#2d2d2d55'

theme.bg_normal     = '#dedede55'
theme.bg_focus      = '#dedede55'
theme.bg_urgent     = '#ff000055'
theme.bg_minimize   = '#dedede55'

theme.bg_systray    = theme.bg_normal

theme.fg_normal     = '#2d2d2d55'
theme.fg_focus      = '#d6393755'
theme.fg_urgent     = '#ff000055'
theme.fg_minimize   = '#4d4d4d55'

theme.border_width  = '0'
theme.border_normal = '#00000055'
theme.border_focus  = '#2d2d2d55'
theme.border_marked = '#91231c55'

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


