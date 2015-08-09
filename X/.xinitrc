#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[ -f ~/.xprofile ] && source ~/.xprofile

# exec gnome-session
# exec startkde
# exec startxfce4



 eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
 export SSH_AUTH_SOCK

pkill nm-applet;
pkill xfconfd

exec startxfce4

