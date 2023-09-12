#!/usr/bin/bash

if swaymsg -t get_tree | grep 'music';
then
    cur_focus="$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.focused==true) | .app_id')"

    if [ "$cur_focus" == "music" ]; then
        swaymsg scratchpad show
    else
        swaymsg [app_id="music"] focus
    fi
else
    foot -a music ncmpcpp
fi
