local awful = require("awful")

-- {{{ Main
theme           = {}
theme.wallpaper = os.getenv("AWESOME_BG") or (os.getenv("HOME") .. "/Pictures/air.jpg")
theme.font      = "WenQuanYi Bitmap Song 8"
-- }}}

-- {{{ Colors
theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"
theme.fg_tooltip    = "#1a1a1a"
theme.fg_em         = "brown"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#232d2c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"
-- }}}

-- {{{ Menu
theme.menu_height   = 15
theme.menu_width    = 150
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel   = awful.util.getdir("config") .. "/themes/dust/taglist/squaref.png"
theme.taglist_squares_unsel = awful.util.getdir("config") .. "/themes/dust/taglist/square.png"
-- }}}

-- {{{ Misc
theme.awesome_icon          = awful.util.getdir("config") .. "/themes/dust/awesome-icon.png"
theme.menu_submenu_icon     = "/usr/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = awful.util.getdir("config") .. "/themes/dust/layouts/tilew.png"
theme.layout_tileleft   = awful.util.getdir("config") .. "/themes/dust/layouts/tileleftw.png"
theme.layout_tilebottom = awful.util.getdir("config") .. "/themes/dust/layouts/tilebottomw.png"
theme.layout_tiletop    = awful.util.getdir("config") .. "/themes/dust/layouts/tiletopw.png"
theme.layout_fairv      = awful.util.getdir("config") .. "/themes/dust/layouts/fairvw.png"
theme.layout_fairh      = awful.util.getdir("config") .. "/themes/dust/layouts/fairhw.png"
theme.layout_spiral     = awful.util.getdir("config") .. "/themes/dust/layouts/spiralw.png"
theme.layout_dwindle    = awful.util.getdir("config") .. "/themes/dust/layouts/dwindlew.png"
theme.layout_max        = awful.util.getdir("config") .. "/themes/dust/layouts/maxw.png"
theme.layout_fullscreen = awful.util.getdir("config") .. "/themes/dust/layouts/fullscreenw.png"
theme.layout_magnifier  = awful.util.getdir("config") .. "/themes/dust/layouts/magnifierw.png"
theme.layout_floating   = awful.util.getdir("config") .. "/themes/dust/layouts/floatingw.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_normal              = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive     = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = awful.util.getdir("config") .. "/themes/dust/layouts/tilew.png"
theme.layout_tileleft   = awful.util.getdir("config") .. "/themes/dust/layouts/tileleftw.png"
theme.layout_tilebottom = awful.util.getdir("config") .. "/themes/dust/layouts/tilebottomw.png"
theme.layout_tiletop    = awful.util.getdir("config") .. "/themes/dust/layouts/tiletopw.png"
theme.layout_fairv      = awful.util.getdir("config") .. "/themes/dust/layouts/fairvw.png"
theme.layout_fairh      = awful.util.getdir("config") .. "/themes/dust/layouts/fairhw.png"
theme.layout_spiral     = awful.util.getdir("config") .. "/themes/dust/layouts/spiralw.png"
theme.layout_dwindle    = awful.util.getdir("config") .. "/themes/dust/layouts/dwindlew.png"
theme.layout_max        = awful.util.getdir("config") .. "/themes/dust/layouts/maxw.png"
theme.layout_fullscreen = awful.util.getdir("config") .. "/themes/dust/layouts/fullscreenw.png"
theme.layout_magnifier  = awful.util.getdir("config") .. "/themes/dust/layouts/magnifierw.png"
theme.layout_floating   = awful.util.getdir("config") .. "/themes/dust/layouts/floatingw.png"
-- }}}

return theme

