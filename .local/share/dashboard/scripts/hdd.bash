#!/usr/bin/bash

paths="/home/$USER/.local/share/dashboard"
term="kitty -e bash -c"

echo
echo ====================
echo
echo Disk Luks Setup!
echo
echo 1, to mount
echo
echo 2, to umount
echo
echo 3, to display disks
echo
echo 0, to quit
echo
echo ====================
echo

read -p "Choose an Option.. [1/2/0] " respons

case $respons in
	'1') doas cryptsetup open UUID="45678332-cab5-4ff5-84f7-6f351914c2f0" disk &&
	     doas mount /dev/mapper/disk /home/$USER/media/disk &&
	     bash $paths/scripts/hdd.bash ;;

	'2') doas umount /dev/mapper/disk &&
	     doas cryptsetup close disk &&
	     bash $paths/scripts/hdd.bash ;;

	'3') lsblk &&
	     bash $paths/scripts/hdd.bash ;;

	'0') exit 1 ;;

	*) bash $paths/scripts/hdd.bash ;;
esac
