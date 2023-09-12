#!/usr/bin/bash

paths="/home/$USER/.local/share/dashboard"
term="kitty -e bash -c"

case "$(printf "hdd\nhome" | bemenu --fn 'JetBrains Mono 10' -c -B 3 -R 9 -f -n -M 500 -l 15 -p 'dashboard' --bdr '#8311DB' --hb '#8311DB' --nb '#292929' --ab '#292929' --fb '#292929' --hf '#FAF9F9' --tb '#8311DB' --tf '#FAF9F9')" in

	'hdd') $term "bash /home/$USER/.local/share/dashboard/scripts/hdd.bash" ;;

	'home') dashboard ;;

	*) exit 1 ;;
esac
