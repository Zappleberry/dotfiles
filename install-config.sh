#!/bin/sh

download_dir=$(pwd)

# linking Xdefaults, Xmodmap, and rofi-themes
ln -sv $download_dir/Xdefaults ~/.Xdefaults
ln -sv $download_dir/Xmodmap ~/.Xmodmap
ln -sv $download_dir/rofi-themes ~/.rofi-themes

# linking configuration files
ln -sv $download_dir/config/dunst ~/.config/dunst
ln -sv $download_dir/config/feh ~/.config/feh
ln -sv $download_dir/config/neofetch ~/.config/neofetch
ln -sv $download_dir/config/openbox ~/.config/openbox
ln -sv $download_dir/config/ranger ~/.config/ranger
ln -sv $download_dir/config/rofi ~/.config/rofi
ln -sv $download_dir/config/sxhkd ~/.config/sxhkd
ln -sv $download_dir/config/zathura ~/.config/zathura

# linking spacemacs
ln -sv $download_dir/spacemacs ~/.spacemacs
