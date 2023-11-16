#!/bin/sh

xrdb merge ~/.Xresources &
#playerctld daemon &
nitrogen --restore &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
(sleep 5; nm-applet) &
(sleep 5; blueman-applet) &
1numlockx on &
#sleep 40 && mpDris2 &
mpDris2 &
firewall-applet &
sleep 5 && pasystray --notify=none &
caffeine &
dunst -conf ~/.config/dunst/dunstrc &
picom --config ~/.config/picom/picom_fvwm.conf --daemon &
(sleep 1; xautolock -time 10 -locker lock -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'") &
#sleep 10 && mpd &
#playerctl_fix.sh &
#restart_mpdris2.sh &
dbus-update-activation-environment --all &
gnome-keyring-daemon --start --components=secrets &
exec dbus-launch --sh-syntax --exit-with-session /usr/bin/fvwm3 2>&1 | tee ~/.fvwm.log

