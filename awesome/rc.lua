local gears     = require 'gears'
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
    function (err)
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
  awful.layout.suit.tile,
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
  local names  = { ' Term', ' Term', ' Dev', ' WWW', ' FM', ' Daily' }
  local layout = {}
  local icons  = {}

  for i, _ in ipairs(names) do
    layout[i] = layouts[2]
    icons[i]  = beautiful.arrr
  end

  layout[#layout] = layouts[1]

  tags = {}

  for s = 1, screen.count() do
    tags[s] = awful.tag(names, s, layout)

    for i = 1, #names do
      awful.tag.seticon(icons[i], tags[s][i])
    end
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
    { "Awesome",      myawsomemenu, beautiful.awesome_icon };
    { "Browser",      "chromium",   beautiful.browser      };
    { "Text Editor",  "gvim",       beautiful.text_editor  };
    { "File Manager", "pcmanfm",    beautiful.thunar       };
    { "Terminal",     terminal,     beautiful.terminal     };
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
  awful.button({ }, 4, function (t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
  awful.button({ }, 5, function (t) awful.tag.viewprev(awful.tag.getscreen(t)) end))

mytasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, function (c)
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

  awful.button({ }, 3, function ()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients{ width=250 }
    end
  end),

  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),

  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end))

mylauncher = awful.widget.launcher {
  image = beautiful.awesome_icon;
  menu  = mymainmenu;
}

for s = 1, screen.count() do
  mywibox[s]     = awful.wibox {
    position     = "top";
    height       = 12;
    screen       = s
  }

  mypromptbox[s] = awful.widget.prompt {
    prompt       = ' Shell >> ';
  }

  -- Layoutbox
  mylayoutbox[s] = widgets.layoutbox(s)

  mylayoutbox[s]:buttons(awful.util.table.join(
      awful.button({ }, 1, function () awful.layout.inc(layouts,  1) end),
      awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
      awful.button({ }, 4, function () awful.layout.inc(layouts,  1) end),
      awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

  mytaglist[s]      = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
  mytasklist[s]     = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

  local left_wibox  = wibox.layout.fixed.horizontal()

  left_wibox:add(mylauncher)
  left_wibox:add(widgets.space_sep)
  left_wibox:add(widgets.arrr)
  left_wibox:add(mypromptbox[s])
  left_wibox:add(mytaglist[s])
  left_wibox:add(widgets.arrr)
  left_wibox:add(widgets.space_sep)
  left_wibox:add(mylayoutbox[s])
  left_wibox:add(widgets.space_sep)
  left_wibox:add(widgets.arrr)
  left_wibox:add(widgets.arrr)

  local right_wibox = wibox.layout.fixed.horizontal()

  right_wibox:add(widgets.arrl)
  right_wibox:add(widgets.arrl)
  right_wibox:add(widgets.space_sep)
  right_wibox:add(widgets.mocp_icon)
  right_wibox:add(widgets.space_sep)
  right_wibox:add(widgets.mocp)
  right_wibox:add(widgets.space_sep)
  right_wibox:add(widgets.arrl)
  right_wibox:add(widgets.space_sep)

  right_wibox:add(widgets.volume_icon)
  right_wibox:add(widgets.volume)
  widgets.spaced_arrl(right_wibox)

  right_wibox:add(widgets.battery_icon)
  right_wibox:add(widgets.battery)
  widgets.spaced_arrl(right_wibox)

  if s == 1 then
    right_wibox:add(wibox.widget.systray())
    widgets.spaced_arrl(right_wibox)
  end

  right_wibox:add(widgets.clock_icon)
  right_wibox:add(widgets.space_sep)
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
  awful.key({ modkey }, "Left",   awful.tag.viewprev),
  awful.key({ modkey }, "Right",  awful.tag.viewnext),
  awful.key({ modkey }, "Escape", awful.tag.history.restore),

  awful.key({ modkey }, "w", function () mymainmenu:toggle() end),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
  awful.key({ modkey            }, "u", awful.client.urgent.jumpto),
  awful.key({ modkey            }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then client.focus:raise() end
    end),

  -- Window Management
  awful.key({ modkey }, "j",
    function ()
      awful.client.focus.byidx( 1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey }, "k",
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end),

  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
  awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

  awful.key({ modkey, "Control" }, "n", awful.client.restore),


  -- Media key
  awful.key({ modkey }, "XF86AudioLowerVolume", function () awful.util.spawn 'amixer sset Master,0 5%-'  end),
  awful.key({ modkey }, "XF86AudioRaiseVolume", function () awful.util.spawn 'amixer sset Master,0 5%+'  end),
  awful.key({ modkey }, "XF86AudioMute",        function () awful.util.spawn 'amixer sset Master toggle' end),
  awful.key({ modkey }, "XF86AudioPlay",        function () awful.util.spawn 'mocp --toggle-pause'       end),
  awful.key({ modkey }, "XF86AudioNext",        function () awful.util.spawn 'mocp --next'               end),
  awful.key({ modkey }, "XF86AudioPrev",        function () awful.util.spawn 'mocp --previous'           end),

  awful.key({ }, "Print",
    function ()
      awful.util.spawn_with_shell([=[/usr/bin/scrot -e 'echo "require [[naughty]][ [[notify]] ] ]=]
        .. [=[ { title = [[Scrot Done!]]; text = [[Saved as ~/Pictures/$f]] }" | awesome-client; mv $f ~/Pictures/']=])
    end),

  awful.key({ altkey }, "Print",
    function ()
      awful.util.spawn_with_shell([=[/usr/bin/scrot -s -b -e 'echo "require [[naughty]][ [[notify]] ] ]=]
        .. [=[ { title = [[Scrot Done!]]; text = [[Saved as ~/Pictures/$f]] }" | awesome-client; mv $f ~/Pictures/']=])
    end),


  -- Standard program
  awful.key({ modkey }, "Return", function () awful.util.spawn(terminal) end),
  awful.key({ modkey }, "g",      function () awful.util.spawn 'pcmanfm' end),
  awful.key({ modkey }, "v",      function () awful.util.spawn 'gvim'    end),

  awful.key({ modkey, "Shift" }, "q", awesome.quit),

  -- Prompt
  awful.key({ modkey }, "r",
    function ()
      mypromptbox[mouse.screen]:run {
        prompt = ' Shell >> ';
      }
    end),

  awful.key({ modkey }, "x",
    function ()
      awful.prompt.run(
        {
          prompt = ' Lua >> ';
        },
        mypromptbox[mouse.screen].widget,
        awful.util.eval,
        nil,
        awful.util.getdir("cache") .. '/history_eval')
    end)
)

clientkeys = awful.util.table.join(
  awful.key({ modkey }, "f", function (c) c.fullscreen = not c.fullscreen end),
  awful.key({ modkey }, "c", function (c) c:kill()                        end),
  awful.key({ modkey }, "o", awful.client.movetoscreen),
  awful.key({ modkey }, "t", function (c) c.ontop = not c.ontop end),
  awful.key({ modkey }, "n", function (c) c.minimized = true    end),
  awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle),
  awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),

  -- Maximize
  awful.key({ modkey }, "m",
    function (c)
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
      function ()
        local screen = mouse.screen
        if tags[screen][i].selected then
          awful.tag.history.restore(screen)
        elseif tags[screen][i] then
          awful.tag.viewonly(tags[screen][i])
        end
      end),

    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewtoggle(tags[screen][i])
        end
      end),

    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.movetotag(tags[client.focus.screen][i])
        end
      end),

    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.toggletag(tags[client.focus.screen][i])
        end
      end))
end

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
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
      focus        = awful.client.focus.filter;
      keys         = clientkeys;
      buttons      = clientbuttons;
    }
  };
}
-- }}}

-- {{{ Signals
client.connect_signal("manage",
  function (c, startup)
    if c.class == 'gvim' or c.class == 'Gvim' then
      c.size_hints_honor = true
    else
      c.size_hints_honor = false
    end



    -- Sloppy focus
    c:connect_signal("mouse::enter",
      function (c)
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
  end)

client.connect_signal("focus",   function (c) c.border_color = beautiful.border_focus  end)
client.connect_signal("unfocus", function (c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Auto cmd
do
  local run_once = function (cmd)
    findme = cmd
    firstspace = cmd:find ' '
    if firstspace then
      findme = cmd:sub(0, firstspace - 1)
    end

    awful.util.spawn_with_shell(
      'pgrep -u $USER -x ' .. findme
      .. ' > /dev/null || (' .. cmd .. ')')
  end

  local cmds = {
    'xfsettingsd &';
    'xcompmgr -Ss -n -Cc -fF -I-10 -O-10 -D1 -t-3 -l-4 -r4 &';
    'fcitx &';
    'xset -b';
  }

  for _,i in ipairs(cmds) do awful.util.spawn_with_shell(i) end
end
-- }}}

