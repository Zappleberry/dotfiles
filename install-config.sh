#!/bin/bash

download_dir=$(pwd)

# When using ln -s on a directory, make sure that the option -T is invoked, otherwise you will get a infinite loop

# linking Xdefaults, Xmodmap, and rofi-themes
ln -sfv $download_dir/.Xdefaults ~/.Xdefaults
ln -sfv $download_dir/.Xmodmap ~/.Xmodmap
ln -sfv $download_dir/.xinitrc ~/.xinitrc
ln -sfTv $download_dir/.rofi-themes ~/.rofi-themes
ln -sfv $download_dir/.bashrc ~/.bashrc
ln -sfv $download_dir/.vimrc ~/.vimrc
ln -sfv $download_dir/.octaverc ~/.octaverc
ln -sfv $download_dir/.bash_profile ~/.bash_profile
ln -sfv $download_dir/.bash_aliases ~/.bash_aliases
ln -sfv $download_dir/.profile ~/.profile
ln -sfv $download_dir/.emoji ~/.emoji

# linking configuration files.
ln -sfTv $download_dir/.config/dunst/ ~/.config/dunst
ln -sfTv $download_dir/.config/feh/ ~/.config/feh
ln -sfTv $download_dir/.config/neofetch/ ~/.config/neofetch
mkdir ~/.config/ranger
ln -sfv $download_dir/.config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfv $download_dir/.config/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sfv $download_dir/.config/ranger/scope.sh ~/.config/ranger/scope.sh
ln -sfv $download_dir/.config/ranger/commands.py ~/.config/ranger/commands.py
ln -sfv $download_dir/.config/ranger/commands_full.py ~/.config/ranger/commands_full.py
ln -sfTv $download_dir/.config/rofi/ ~/.config/rofi
ln -sfTv $download_dir/.config/polybar/ ~/.config/polybar
ln -sfTv $download_dir/.config/sxhkd/ ~/.config/sxhkd
# uncomment this line to use a different window manager config instead of bspwm
#ln -sfTv $download_dir/.config/i3/ ~/.config/i3
#ln -sfTv $download_dir/.config/openbox/ ~/.config/openbox
ln -sfTv $download_dir/.config/bspwm/ ~/.config/bspwm
ln -sfTv $download_dir/.config/zathura/ ~/.config/zathura
mkdir ~/.newsboat
ln -sfv $download_dir/.config/newsboat/config ~/.newsboat/config
ln -sfv $download_dir/.config/newsboat/urls ~/.newsboat/urls
ln -sfv $download_dir/.config/urlview ~/.urlview

# link fonts
mkdir ~/.fonts
ln -sfTv $download_dir/.fonts/misc/ ~/.fonts/misc

# link cursors
ln -sfTv $download_dir/.icons ~/.icons

# linking spacemacs
# This may become a .emacs.d in the future?
# ln -sfv $download_dir/.spacemacs ~/.spacemacs

# Link UserChrome folder for firefox
default_firefox=$(ls ~/.mozilla/firefox | grep -i "default")
ln -sfTv $download_dir/.mozilla/firefox/chrome ~/.mozilla/firefox/$default_firefox/chrome

# link bar
#mkdir ~/.bar
#ln -sfv $download_dir/bar/panel-ashes ~/.bar/panel
