#!/bin/sh

download_dir=$(pwd)

# When using ln -s on a directory, make sure that the option -T is invoked, otherwise you will get a infinite loop

# linking Xdefaults, Xmodmap, and rofi-themes
ln -sv $download_dir/Xdefaults ~/.Xdefaults
ln -sv $download_dir/Xmodmap ~/.Xmodmap
ln -sfTv $download_dir/rofi-themes ~/.rofi-themes
ln -sfv $download_dir/bashrc ~/.bashrc
ln -sfv $download_dir/vimrc ~/.vimrc
ln -sfv $download_dir/bash_profile ~/.bash_profile

# linking configuration files.
ln -sTv $download_dir/config/dunst/ ~/.config/dunst
ln -sTv $download_dir/config/feh/ ~/.config/feh
ln -sTv $download_dir/config/neofetch/ ~/.config/neofetch
ln -sTv $download_dir/config/openbox/ ~/.config/openbox
ln -sTv $download_dir/config/ranger/ ~/.config/ranger
ln -sTv $download_dir/config/rofi/ ~/.config/rofi
ln -sTv $download_dir/config/sxhkd/ ~/.config/sxhkd
ln -sTv $download_dir/config/zathura/ ~/.config/zathura
ln -sTv $download_dir/config/newsboat/ ~/.newsboat # Needs further modification

# link fonts
mkdir ~/.fonts
ln -sTv $download_dir/fonts/misc/ ~/.fonts/misc

# linking spacemacs
# This may become a .emacs.d in the future?
ln -sv $download_dir/spacemacs ~/.spacemacs
