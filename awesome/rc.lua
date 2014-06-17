local gears = require 'gears'
local awful     = require 'awful'
local wibox     = require 'wibox'
local beautiful = require 'beautiful'
local naughty   = require 'naughty'
local widgets   = require 'lib.widgets'

require 'lib.preconfig'


-- {{{ Error handling
-- Startup
if awesome.startup_errors then
  naughty.notify {
    preset = naughty.config.presets.critical;
    title  = "Oops, there were errors during startup!";
    text   = awesome.startup_errors;
  }
end

-- Runtime
do
  local in_error = false
  awesome.connect_signal("debug::error",
    function(err)
      if in_error then return end
      in_error = true

      naughty.notify {
        preset = naughty.config.presets.critical;
        title  = "Oops, an error happened!";
        text   = err;
      }

      in_error = false
    end)
end
-- }}}

-- {{{ Layouts
local layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
  for s = 1, screen.count() do
    gears.wallpaper.maximized(beautiful.wallpaper, s, true)
  end
end
-- }}}

-- {{{ Tags
do
  local names  = { "１", "２", "⑨", "☯" }
  local layout = {}
  for i, _ in ipairs(names) do
    layout[i] = layouts[2]
  end

  layout[#layout] = layouts[1]

  tags = {
    names  = names;
    layout = layout;
  }

  for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)
  end
end
-- }}}

-- {{{ Menu
myawsomemenu = {
  { "Restart", awesome.restart };
  { "Quit",    awesome.quit    };
}

mymainmenu = awful.menu {
  items = {
    { "Awesome", myawsomemenu, beautiful.awesome_icon };
    { "File Manager", "thunar" };
    { "Browser", "chromium" };
    { "Text Editor", "gvim" };
    { "Terminal", terminal };
  }
}
-- }}}

-- {{{ Wiboxes
mywibox     = {}
mygraphbox  = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist   = {}
mytasklist  = {}

mytaglist.buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
  awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end))

mytasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, function(c)
    if c == client.focus then
      c.minimized = true
    else
      c.minimized = false
      if not c:isvisible() then
        awful.tag.viewonly(c:tags()[1])
      end
      client.focus = c
      c:raise()
    end
  end),

  awful.button({ }, 3, function()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients{ width=250 }
    end
  end),

  awful.button({ }, 4, function()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),

  awful.button({ }, 5, function()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end))

for s = 1, screen.count() do
  mypromptbox[s]    = awful.widget.prompt { prompt = " Shell >> " }

  -- Layoutbox
  mylayoutbox[s]    = awful.widget.layoutbox(s)
  mylayoutbox[s]:buttons(awful.util.table.join(
      awful.button({ }, 1, function() awful.layout.inc(layouts,  1) end),
      awful.button({ }, 3, function() awful.layout.inc(layouts, -1) end),
      awful.button({ }, 4, function() awful.layout.inc(layouts,  1) end),
      awful.button({ }, 5, function() awful.layout.inc(layouts, -1) end)))

  mytaglist[s]      = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
  mytasklist[s]     = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
  mywibox[s]        = awful.wibox { position = "top", height = 12, screen = s }

  local left_wibox  = wibox.layout.fixed.horizontal()

  left_wibox:add(mytaglist[s])
  left_wibox:add(mypromptbox[s])

  local right_wibox = wibox.layout.fixed.horizontal()

  right_wibox:add(widgets.mocp)
  right_wibox:add(widgets.sep)

  --right_wibox:add(widgets.uptime)
  --right_wibox:add(widgets.sep)

  right_wibox:add(widgets.volume)
  right_wibox:add(widgets.sep)

  right_wibox:add(widgets.battery)
  right_wibox:add(widgets.sep)

  if s == 1 then right_wibox:add(wibox.widget.systray()) end

  right_wibox:add(widgets.textclock)

  local wibox_layout = wibox.layout.align.horizontal()

  wibox_layout:set_left(left_wibox)
  wibox_layout:set_middle(mytasklist[s])
  wibox_layout:set_right(right_wibox)

  mywibox[s]:set_widget(wibox_layout)
end
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
  awful.key({ modkey }, "Left", awful.tag.viewprev ),
  awful.key({ modkey }, "Right", awful.tag.viewnext ),
  awful.key({ modkey }, "Escape", awful.tag.history.restore),

  awful.key({ modkey }, "w", function () mymainmenu:show() end),

  awful.key({ altkey }, "r",
    function()
      awful.client.focus.byidx(1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey, "Shift" }, "Tab",
    function()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end),

  --XF86 function keys
  awful.key({ }, "XF86AudioLowerVolume", function() awful.util.spawn("amixer sset Master,0 5%-")  end),
  awful.key({ }, "XF86AudioRaiseVolume", function() awful.util.spawn("amixer sset Master,0 5%+")  end),
  awful.key({ }, "XF86AudioMute",        function() awful.util.spawn("amixer sset Master toggle") end),
  awful.key({ }, "XF86AudioPlay",        function() awful.util.spawn("mocp --toggle")             end),
  awful.key({ }, "XF86AudioNext",        function() awful.util.spawn("mocp --next")               end),
  awful.key({ }, "XF86AudioPrev",        function() awful.util.spawn("mocp --previous")           end),

  awful.key({ }, "Print",
    function ()
      awful.util.spawn_with_shell "/usr/bin/scrot -e 'mv $f ~/Pictures/'";

      naughty.notify {
        title = "Scrot Done !";
        text  = "Save file into ~/Pictures/";
      }
    end),

  awful.key({ altkey }, "Print",
    function ()
      awful.util.spawn_with_shell "/usr/bin/scrot -u -e 'mv $f ~/Pictures/'";

      naughty.notify {
        title = "Scrot Done !";
        text  = "Save file into ~/Pictures/";
      }
    end),

  awful.key({ modkey }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end),

  -- Layout manipulation
  awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx( 1) end),
  awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end),
  awful.key({ modkey, }, "Tab",       function() awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Shift" }, "Tab", function() awful.screen.focus_relative(-1) end),
  awful.key({ modkey, }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey, }, "p",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end),

  -- Standard program
  awful.key({ modkey }, "Return", function() awful.util.spawn(terminal) end),
  awful.key({ modkey }, "g",      function() awful.util.spawn("thunar") end),
  awful.key({ modkey }, "e",      function() awful.util.spawn("gvim") end),

  awful.key({ modkey, "Shift"   }, "q", awesome.quit),

  awful.key({ modkey }, "l", function() awful.tag.incmwfact( 0.05) end),
  awful.key({ modkey }, "h", function() awful.tag.incmwfact(-0.05) end),
  awful.key({ modkey }, "k", function() awful.client.incwfact( 0.03) end),
  awful.key({ modkey }, "j", function() awful.client.incwfact(-0.03) end),

  awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster( 1) end),
  awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1) end),
  awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol( 1) end),
  awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1) end),
  awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(layouts, -1) end),

  awful.key({ modkey }, "space", function() awful.layout.inc(layouts, 1) end),

  awful.key({ modkey, "Control" }, "n", awful.client.restore),

  -- Prompt
  awful.key({ modkey }, "r", function() mypromptbox[mouse.screen]:run() end),

  awful.key({ modkey }, "x",
    function()
      awful.prompt.run(
        { prompt = "Lua >> " },
        mypromptbox[mouse.screen].widget,
        awful.util.eval, nil,
        awful.util.getdir("cache") .. "/history_eval")
    end)
)

clientkeys = awful.util.table.join(
  awful.key({ modkey }, "f", function(c) c.fullscreen = not c.fullscreen end),
  awful.key({ modkey }, "c", function(c) c:kill() end),
  awful.key({ modkey }, "o", awful.client.movetoscreen ),
  awful.key({ modkey }, "t", function(c) c.ontop = not c.ontop end),
  awful.key({ modkey }, "n", function(c) c.minimized = true end),
  awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle ),
  awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end),

  -- Maximize
  awful.key({ modkey }, "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c.maximized_vertical   = not c.maximized_vertical
    end)
)

keynumber = 0
for s = 1, screen.count() do
  keynumber = math.min(9, math.max(#tags[s], keynumber))
end

for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
      function()
        local screen = mouse.screen
        if tags[screen][i].selected then
          awful.tag.history.restore(screen)
        elseif tags[screen][i] then
          awful.tag.viewonly(tags[screen][i])
        end
      end),

    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewtoggle(tags[screen][i])
        end
      end),

    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.movetotag(tags[client.focus.screen][i])
        end
      end),

    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.toggletag(tags[client.focus.screen][i])
        end
      end))
end

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function(c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
  {
    rule       = { };
    properties = {
      border_width = beautiful.border_width;
      border_color = beautiful.border_normal;
      focus = awful.client.focus.filter;
      keys = clientkeys;
      buttons = clientbuttons;
    }
  };
}
-- }}}

-- {{{ Signals
client.connect_signal("manage",
  function(c, startup)
    c.size_hints_honor = false

    -- Sloppy focus
    c:connect_signal("mouse::enter",
      function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
          client.focus = c
        end
      end)

    if not startup then
      -- Set the windows at the slave
      awful.client.setslave(c)

      -- Put windows in a smart way, only if they does not set an initial position
      if not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_overlap(c)
        awful.placement.no_offscreen(c)
      end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
      local left_layout = wibox.layout.fixed.horizontal()
      left_layout:add(awful.titlebar.widget.iconwidget(c))

      local right_layout = wibox.layout.fixed.horizontal()
      right_layout:add(awful.titlebar.widget.floatingbutton(c))
      right_layout:add(awful.titlebar.widget.maximizedbutton(c))
      right_layout:add(awful.titlebar.widget.stickybutton(c))
      right_layout:add(awful.titlebar.widget.ontopbutton(c))
      right_layout:add(awful.titlebar.widget.closebutton(c))

      local title = awful.titlebar.widget.titlewidget(c)
      title:buttons(awful.util.table.join(
        awful.button({ }, 1,
          function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
          end),
        awful.button({ }, 3,
          function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
          end)
      ))

      local layout = wibox.layout.align.horizontal()
      layout:set_left(left_layout)
      layout:set_right(right_layout)
      layout:set_middle(title)

      awful.titlebar(c):set_widget(layout)
    end
  end)

client.connect_signal("focus",   function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Auto cmd
do
  local cmds = {
    "xfsettingsd &";
    -- "xcompmgr -Ss -n -Cc -fF -I-10 -O-10 -D1 -t-3 -l-4 -r4 &";
    "nm-applet &";
    "fcitx &";
    "xset -b";
  }

  for _,i in pairs(cmds) do awful.util.spawn(i) end
end
-- }}}

