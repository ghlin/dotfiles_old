require 'lib.preconfig'

local awful     = require 'awful'
local wibox     = require 'wibox'
local beautiful = require 'beautiful'
local vicious   = require 'vicious'
local naughty   = require 'naughty'

vicious.cache(vicious.widgets.uptime)

local uptime = wibox.widget.textbox()
vicious.register(uptime, vicious.widgets.uptime, 'Uptime : $1 day(s) - $2:$3', 60)


local mocp     = wibox.widget.textbox()

local coloured = function (text, colour)
  colour = colour or 'white'
  return '<span foreground="' .. colour .. '">' .. text .. '</span>'
end

local mocp_on_song_stop   = function ()
  mocp:set_markup(coloured 'Stoped')
end

local mocp_on_song_change = function (title, ar, file)
  if title == '' then title = file      end
  if ar == ''    then ar    = 'Unknown' end

  mocp:set_markup(coloured '♬ ' .. coloured(title, 'cyan') .. ' By ' .. coloured(ar, 'red'))
end

vicious.cache(vicious.widgets.volume)

local volume = wibox.widget.textbox()
vicious.register(volume, vicious.widgets.volume, 'Vol : $1%', nil, 'Master')

-- Buttons
volume:buttons(awful.util.table.join(
  awful.button({ }, 1,
    function () awful.util.spawn_with_shell 'amixer sset Master toggle' end),
  awful.button({ }, 4,
    function () awful.util.spawn_with_shell 'amixer sset Master,0 5%+'  end),
  awful.button({ }, 5,
    function () awful.util.spawn_with_shell 'amixer sset Master,0 5%-'  end)
))

-- {{{ BATTERY
-- Battery attributes
local bat_state  = ''
local bat_charge = 0
local bat_time   = 0
local blink      = true

-- Charge %
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

    return 'Bat : ' .. coloured(bat_state .. ' ' .. bat_charge .. '%', bat_color)
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

battery:buttons(awful.util.table.join(awful.button({ }, 1, popup_bat)))

local sep = wibox.widget.textbox()
sep:set_text ' | '

local textclock = awful.widget.textclock()

for _, widget in ipairs { uptime, textclock, sep, mocp, battery, volume } do
  widget:set_font(require 'beautiful' ['font'])
end

return {
  sep                 = sep;
  mocp                = mocp;
  mocp_on_song_change = mocp_on_song_change;
  mocp_on_song_stop   = mocp_on_song_stop;
  volume              = volume;
  battery             = battery;
  textclock           = textclock;
  uptime              = uptime;
}

