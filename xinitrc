#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
# . /etc/X11/Xsession

xset b off &
xmodmap ~/.Xmodmap &
echo "hello world" >> ~/world.txt # this tests to see if all these lines are being run
exec startlxde
