#!/bin/sh



###
## Startup Programs/tweaks
###
exec nitrogen --restore &
exec picom --config ~/.config/picom/picom.conf &
exec /usr/local/bin/dwmblocks &
exec sxhkd &
exec xrandr --auto &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
export SUDO_ASKPASS="$HOME/.local/bin/dpass"
##
# Window Manager >-<
##
exec /home/rander/.config/Dwm-Setup/dwm/dwm
