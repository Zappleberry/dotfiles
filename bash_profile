#!/bin/bash

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.scripts/dmenu-sudo" ] ; then
	export SUDO_ASKPASS="$HOME/.scripts/dmenu-sudo"
fi

if [ -f "$HOME/.profile" ] ; then
	source ~/.profile
fi

# Autostart x on login
if [[ ! $DISPLAY && $(tty) == /dev/tty1 ]]; then
  exec startx
fi
