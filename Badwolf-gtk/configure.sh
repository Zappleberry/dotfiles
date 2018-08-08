#!/bin/sh
set -e
_basedir="$(dirname "$(readlink -f "${0}")")"
cd "$_basedir"
if [ ! -t 0 ]; then
	if (command -v x-terminal-emulator >/dev/null 2>&1); then
		x-terminal-emulator -e "$0"; exit 0
	elif (command -v xfce4-terminal >/dev/null 2>&1); then
		xfce4-terminal -e "$0"; exit 0
	elif (command -v mate-terminal >/dev/null 2>&1); then
		mate-terminal -e "$0"; exit 0
	elif (command -v konsole >/dev/null 2>&1); then
		konsole -e "$0"; exit 0
	else
		xterm -e "$0"; exit 0
	fi
fi
####################################################################
#checks!
if [ ! -w "$_basedir" ]; then
	printf "You don't have write permissions - Aborting!\n"
	sleep 5
	exit 1
fi
##check if theme is in a theme path
if [ ! "$(dirname $PWD|sed 's|/DarK$||;s|^.*/||')" = "themes" ]; then
	printf "\n Dark theme is not installed - aborting!"
fi
##check if icon theme is installed
if [ -d "/usr/share/icons/DarK-theme-icons" ]; then
	printf "\n"
elif [ -d "/usr/local/share/icons/DarK-theme-icons" ]; then
	printf "\n"
elif [ -d "$_basedir/../../icons/DarK-theme-icons" ]; then
	printf "\n"
elif [ ! -d "$HOME/.local/share/icons/DarK-theme-icons" ]; then
	printf "\n"
elif [ ! -d "$HOME/.icons/DarK-theme-icons" ]; then
	printf "\n"
else
	printf "\nWARNING! - DarK icon theme not installed \nthe GTK3 theme will not work correctly!"
	sleep 5
fi
##common deps
(command -v sed >/dev/null 2>&1 && command -v tr >/dev/null 2>&1 && command -v find >/dev/null 2>&1 || _missingdep=true)
case $_missingdep in
	true)
		printf "You either miss sed, tr, or find! Aborting!\n"
		exit 1
	;;
esac
########################################################################

createbasethemesymlinks_() {
#check if we have permissions
	if [ -d "$_basedir"/../DarK@2 ]; then
		printf "already done..."
	else
		if [ ! -w "$_basedir/.." ]; then
			printf "You don't have write permissions in .. !\n"
			sleep 5
			exit 1
		else
			printf "creating links\n"
			for _dir in $(find Extras/Sub_themes -mindepth 1 -maxdepth 1 -type d); do
				ln -sf DarK/"$_dir" "../$(echo "$_dir"|sed 's|^.*/||')"
			done
		fi
	fi
}

changecolor_() {
	if (command -v x-terminal-emulator >/dev/null 2>&1); then
		x-terminal-emulator -e "$_basedir"/.changecolor.sh
	elif (command -v xfce4-terminal >/dev/null 2>&1); then
		xfce4-terminal -e "$_basedir"/.changecolor.sh
	elif (command -v mate-terminal >/dev/null 2>&1); then
		mate-terminal -e "$_basedir"/.changecolor.sh
	elif (command -v konsole >/dev/null 2>&1); then
		konsole -e "$_basedir"/.changecolor.sh
	else
		xterm -e "$_basedir"/.changecolor.sh
	fi
}

toggleiconoverrides_() {
	if [ -f "$_basedir"/gtk-2.0/settings.ini ]; then
		if (grep '^include "theme/iconoverridesr.c"' "$_basedir"/gtk-2.0/settings.ini); then
			printf "removing iconoverrides\n"
			sed -i 's|include "theme/iconoverridesr.c"|#include "theme/iconoverridesr.c"|g' "$_basedir"/gtk-2.0/settings.ini
			sed -i 's|include "theme/iconoverridesr.c"|#include "theme/iconoverridesr.c"|g' "$_basedir"/Extras/Sub_themes/DarK@2/gtk-2.0/settings.ini
		else
			printf "adding iconoverrides\n"
			sed -i 's|#include "theme/iconoverridesr.c"|include "theme/iconoverridesr.c"|g' "$_basedir"/gtk-2.0/settings.ini
			sed -i 's|#include "theme/iconoverridesr.c"|include "theme/iconoverridesr.c"|g' "$_basedir"/Extras/Sub_themes/DarK@2/gtk-2.0/settings.ini
		fi
	fi
}

toggleboldmenu_() {
	if [ -f "$_basedir"/gtk-2.0/settings.ini ]; then
		if (grep '^include "theme/boldmenur.c"' "$_basedir"/gtk-2.0/settings.ini); then
			printf "removing bold text\n"
			sed -i 's|include "theme/boldmenur.c"|#include "theme/boldmenur.c"|g' "$_basedir"/gtk-2.0/settings.ini
			sed -i 's|include "theme/boldmenur.c"|#include "theme/boldmenur.c"|g' "$_basedir"/Extras/Sub_themes/DarK@2/gtk-2.0/settings.ini
		else
			printf "adding bold text\n"
			sed -i 's|#include "theme/boldmenur.c"|include "theme/boldmenur.c"|g' "$_basedir"/gtk-2.0/settings.ini
			sed -i 's|#include "theme/boldmenur.c"|include "theme/boldmenur.c"|g' "$_basedir"/Extras/Sub_themes/DarK@2/gtk-2.0/settings.ini
		fi
	fi
	if [ -f "$_basedir"/gtk-3.0/gtk.css ]; then
		if (grep '^@import url("boldmenu.css");"' "$_basedir"/gtk-3.0/gtk.css); then
			sed -i 's|@import url("boldmenu.css");"|/*@import url("boldmenu.css");*/|g' "$_basedir"/gtk-3.0/settings.css
		else
			sed -i 's|/*@import url("boldmenu.css");*/|@import url("boldmenu.css");|g' "$_basedir"/gtk-3.0/settings.css
		fi
	fi
}

setscrollbarstyle_() {
	cat <<\EOF

Please select the style of your scrollbar steppers:
	1: Windows
	2: Platinum
	3: None
	printf "Make your choice: [1,2,3]"
EOF
	read _scrollbarstyle
	if [ "$(echo $_scrollbarstyle)" = "1" ]; then
			printf "Setting Windows-Style!\n"
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-backward-stepper/c\GtkScrollbar::has-backward-stepper=1' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-forward-stepper/c\GtkScrollbar::has-forward-stepper=1'{} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-secondary-backward-stepper/c\GtkScrollbar::has-secondary-backward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-secondary-forward-stepper/c\GtkScrollbar::has-secondary-forward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-backward-stepper:/c\-GtkScrollbar-has-backward-stepper:true;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-forward-stepper:/c\-GtkScrollbar-has-forward-stepper:true;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-secondary-backward-stepper:/c\-GtkScrollbar-has-secondary-backward-stepper:false;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-secondary-forward-stepper:/c\-GtkScrollbar-has-secondary-forward-stepper:false;' {} \;
			sleep 5
	elif [ "$(echo $_scrollbarstyle)" = "2" ]; then
			printf "Setting Platinum-Style!\n"
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-backward-stepper/c\GtkScrollbar::has-backward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-forward-stepper/c\GtkScrollbar::has-forward-stepper=1' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-secondary-backward-stepper/c\GtkScrollbar::has-secondary-backward-stepper=1' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-secondary-forward-stepper/c\GtkScrollbar::has-secondary-forward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-backward-stepper:/c\-GtkScrollbar-has-backward-stepper:false;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-forward-stepper:/c\-GtkScrollbar-has-forward-stepper:true;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-secondary-backward-stepper:/c\-GtkScrollbar-has-secondary-backward-stepper:true;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-secondary-forward-stepper:/c\-GtkScrollbar-has-secondary-forward-stepper:false;' {} \;
	elif [ "$(echo $_scrollbarstyle)" = "3" ]; then
			printf "Setting None-Style!\n"
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-backward-stepper/c\GtkScrollbar::has-backward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-forward-stepper/c\GtkScrollbar::has-forward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-secondary-backward-stepper/c\GtkScrollbar::has-secondary-backward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar::has-secondary-forward-stepper/c\GtkScrollbar::has-secondary-forward-stepper=0' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-backward-stepper:/c\-GtkScrollbar-has-backward-stepper:false;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-forward-stepper:/c\-GtkScrollbar-has-forward-stepper:false;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-secondary-backward-stepper:/c\-GtkScrollbar-has-secondary-backward-stepper:false;' {} \;
			find $_basedir -type f -name settings.ini -exec sed -i '/GtkScrollbar-has-secondary-forward-stepper:/c\-GtkScrollbar-has-secondary-forward-stepper:false;' {} \;
	else
			printf "Ignoring - Not a valid choice!\n"
	fi
}


### start
while [ 1 ]; do
	clear
cat <<\EOF

What would you like to do?:

#1: Setup base theme(creates symlinks for the GTK and WM themes)
#2: Changes the colors of the themes
#3: Toggles GTK2 icon overrides (Your icon theme needs to support them)
#4: Toggles bold menu text
#5: Changes the scrollbarstyle
#6: Exit this script"
EOF

	printf "Make your choice: [1,2,3,4,5,6]"
	read _choice
	case $_choice in
		1)
			clear
			createbasethemesymlinks_
			sleep 3
		;;
		2)
			clear
			changecolor_
			sleep 3
		;;
		3)
			clear
			toggleiconoverrides_
			sleep 3
		;;
		4)
			clear
			toggleboldmenu_
			sleep 3
		;;
		5)
			clear
			sleep 1
			setscrollbarstyle_
			sleep 3
		;;
		6)
			printf "bye\n"
			sleep 0
			break
			exit 0
		;;
		*)
			printf '\nnothing more here\n'
		;;
	esac
done
