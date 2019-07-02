#!/bin/sh

vpn=$(nmcli | grep "VPN connection" | tail -n 1 | sed "s/\sVPN\sconnection//g")
connected=$(nmcli d | awk '{print $3}' | grep connected | grep -v disconnected)

if [ -z $vpn ] && [ -z $connected ]
then
	echo ""
elif [ -z $vpn ]
then
	echo "%{F#ae95c7}%{F-} Disconnected"
else
	echo "%{F#ae95c7}%{F-} $vpn"
fi
