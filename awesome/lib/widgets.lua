require 'lib.preconfig'

local awful     = require 'awful'
local wibox     = require 'wibox'
local beautiful = require 'beautiful'
local vicious   = require 'vicious'
local naughty   = require 'naughty'

local imagebox_from_beautiful = function (item)
  if not beautiful[item] then
    beautiful[item] = awful.util.getdir 'config'
      .. '/theme/numix/icons/' .. item .. 'png'
  end

  local ib = wibox.widget.imagebox(beautiful[item])
  ib:set_resize(false)

  return ib
end

local coloured = function (text, colour)
  colour = colour or 'white'
  return '<span foreground="' .. colour .. '">' .. text .. '</span>'
end

vicious.cache(vicious.widgets.uptime)

local uptime_icon = imagebox_from_beautiful 'uptime'
local uptime = wibox.widget.textbox()
vicious.register(uptime, vicious.widgets.uptime, ' $1 day(s) - $2:$3 ', 60)


local mocp      = wibox.widget.textbox()
local mocp_icon = imagebox_from_beautiful 'music'


local mocp_on_song_stop   = function ()
  mocp:set_markup(coloured 'Stoped')
end

local basename = function (fullpath)
  return string.gsub(fullpath, '(.*/)(.*)', '%2')
end

local mocp_on_song_change = function (title, ar, file)
  -- dirty.
  if not file or file == '' or file == ' ' or file == '  ' then
    mocp_on_song_stop()
    return
  end

  if (not title) or title == '' then
    title = basename(file)
  end

  if (not ar) or ar == '' then
    ar    = 'Unknown'
  end

  mocp:set_markup(coloured(title, 'cyan') .. ' - ' .. coloured(ar, 'red'))
end

local mocp_detect = function ()
  local mocp_client = io.popen [[mocp --format '%state
  %song
  %artist
  %file']]

  local state = mocp_client:read()
  local title = mocp_client:read()
  local ar    = mocp_client:read()
  local file  = mocp_client:read()

  mocp_client:close()

  if state and title and ar and file then
    mocp_on_song_change(title, ar, file)
  else
    mocp_on_song_stop()
  end
end

mocp_detect()

vicious.cache(vicious.widgets.volume)

local volume = wibox.widget.textbox()
vicious.register(volume, vicious.widgets.volume, ' $1%', nil, 'Master')
local volume_icon = imagebox_from_beautiful 'volume'


-- Buttons
local volume_listener = awful.util.table.join(
  awful.button({ }, 1,
    function () awful.util.spawn_with_shell 'amixer sset Master toggle' end),
  awful.button({ }, 4,
    function () awful.util.spawn_with_shell 'amixer sset Master,0 5%+'  end),
  awful.button({ }, 5,
    function () awful.util.spawn_with_shell 'amixer sset Master,0 5%-'  end)
)

volume:buttons(volume_listener)
volume_icon:buttons(volume_listener)


-- {{{ BATTERY
local bat_state  = ''
local bat_charge = 0
local bat_time   = 0


-- Charge %
local battery_icon = imagebox_from_beautiful 'battery'
local battery = wibox.widget.textbox()

vicious.register(battery, vicious.widgets.bat,
  function (widget, args)
    bat_state  = args[1]
    bat_charge = args[2]
    bat_time   = args[3]

    if bat_state == "−" and bat_charge < 3 then
      awful.util.spawn_with_shell 'pm-hibernate'
    end

    local bat_color

    if bat_charge < 20 then
      bat_color = 'red'
    else
      bat_color = 'white'
    end

    return ' ' .. coloured(bat_charge .. '%', bat_color)
  end, nil, 'BAT0')

local popup_bat = function ()
  local state = ''

  if bat_state == '↯' then
    state = 'Full'
  elseif bat_state == '↯' then
    state = 'Charged'
  elseif bat_state == '+' then
    state = 'Charging'
  elseif bat_state == '−' then
    state = 'Discharging'
  elseif bat_state == '⌁' then
    state = 'Not charging'
  else
    state = 'Unknown'
  end

  naughty.notify {
    text          = 'Charge : ' .. bat_charge .. '<br>State  : ' .. state .. '<br>Esct   : ' .. bat_time;
    timeout       = 5;
    hover_timeout = 0.5;
  }
end

local battery_listenter = awful.util.table.join(awful.button({ }, 1, popup_bat))
battery:buttons(battery_listenter)
battery_icon:buttons(battery_listenter)

local arrl = imagebox_from_beautiful 'arrl'
arrl:set_resize(true) -- patch here
local arrr = imagebox_from_beautiful 'arrr'
arrr:set_resize(true) -- patch here

local clock_icon = imagebox_from_beautiful 'clock'
local textclock  = awful.widget.textclock '%a %d %b %H:%M'


local space_textbox = wibox.widget.textbox ' '

local space = function (container, widget)
  container:add(space_textbox)
  container:add(widget)
  container:add(space_textbox)
end

local spaced_arrl = function (container)
  space(container, arrl)
end
local spaced_arrr = function (container)
  space(container, arrr)
end

local layoutbox = wibox.widget.textbox 'Layout Box'


local button = require 'awful.button'
local layout = require 'awful.layout'
local tag    = require 'awful.tag'

local update = function (w, screen)
  local layout = layout.getname(layout.get(screen))
  w:set_text('[' .. (layout or 'layout unknown') .. ']')
end

local layoutbox = function (screen)
  local screen = screen or 1
  local w      = wibox.widget.textbox 'layout'

  update(w, screen)

  local  update_on_tag_selection = function(t)
    return update(w, tag.getscreen(t))
  end

  tag.attached_connect_signal(screen, "property::selected", update_on_tag_selection)
  tag.attached_connect_signal(screen, "property::layout", update_on_tag_selection)

  w:set_font 'Terminus 8'
  return w
end

for _, widget in ipairs { sep, mocp } do
  widget:set_font(require 'beautiful' ['font'])
end

for _, widget in ipairs { uptime, textclock, battery, volume } do
  widget:set_font 'Terminus 8'
end

return {
  arrl                = arrl;
  arrr                = arrr;
  mocp                = mocp;
  mocp_icon           = mocp_icon;
  mocp_on_song_change = mocp_on_song_change;
  mocp_on_song_stop   = mocp_on_song_stop;
  mocp_detect         = mocp_detect;
  volume_icon         = volume_icon;
  volume              = volume;
  battery_icon        = battery_icon;
  battery             = battery;
  clock_icon          = clock_icon;
  textclock           = textclock;
  uptime_icon         = uptime_icon;
  uptime              = uptime;
  space_sep           = space_textbox;
  space               = space;
  spaced_arrl         = spaced_arrl;
  spaced_arrr         = spaced_arrr;
  layoutbox           = layoutbox;
}



