#!/bin/sh

userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi

# user init scripts and settings
#[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.xprofile ] && . ~/.xprofile

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export XDG_SESSION_TYPE="x11"
#dbus-update-activation-environment --all
#check_desktop.sh &

#==== for gnome
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#exec gnome-session

#==== for gnome x11
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#xautolock -time 10 -locker 'lock | xset dpms force off' -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'" &
#exec gnome-session

#==== for budgie
#export XDG_CURRENT_DESKTOP=Budgie:GNOME
#exec budgie-desktop

#==== for i3
#export XDG_SESSION_DESKTOP="i3"
#export XDG_CURRENT_DESKTOP="i3"
#exec dbus-run-session i3

#==== for dwm
#export XDG_SESSION_DESKTOP="dwm"
#export XDG_CURRENT_DESKTOP="dwm"
#exec dwmstart.sh

#==== for fvwm3
mpd & 
export XDG_SESSION_DESKTOP="fvwm"
export XDG_CURRENT_DESKTOP="fvwm"
exec fvwmstart.sh

#==== for openbox
export XDG_SESSION_DESKTOP="openbox"
export XDG_CURRENT_DESKTOP="openbox"
exec dbus-run-session openbox-session
#==== for xfce4
#exec startxfce4
