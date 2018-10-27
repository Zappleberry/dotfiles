#!/bin/sh

download_dir=$(pwd)

# linking Xdefaults, Xmodmap, and rofi-themes
ln -sv $download_dir/Xdefaults ~/.Xdefaults
ln -sv $download_dir/Xmodmap ~/.Xmodmap
ln -sTv $download_dir/rofi-themes ~/.rofi-themes
ln -sfv $download_dir/bashrc ~/.bashrc

# linking configuration files. Do not use because it causes infinite loop.
ln -sTv $download_dir/config/dunst/ ~/.config/dunst
ln -sTv $download_dir/config/feh/ ~/.config/feh
ln -sTv $download_dir/config/neofetch/ ~/.config/neofetch
ln -sTv $download_dir/config/openbox/ ~/.config/openbox
ln -sTv $download_dir/config/ranger/ ~/.config/ranger
ln -sTv $download_dir/config/rofi/ ~/.config/rofi
ln -sTv $download_dir/config/sxhkd/ ~/.config/sxhkd
ln -sTv $download_dir/config/zathura/ ~/.config/zathura
ln -sTv $download_dir/config/newsboat/ ~/.newsboat # Needs further modification

# linking spacemacs
# This may become a .emacs.d in the future?
ln -sv $download_dir/spacemacs ~/.spacemacs
