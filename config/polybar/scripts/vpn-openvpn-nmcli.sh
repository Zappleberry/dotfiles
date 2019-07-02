#!/bin/sh

vpn=$(nmcli | grep "VPN connection" | tail -n 1 | sed "s/\sVPN\sconnection//g")
connected=$(nmcli d | awk '{print $3}' | grep connected | grep -v disconnected)

if [ -z $vpn ] && [ -z $connected ]
then
	# not connected to network or vpn
	echo ""
elif [ -z $vpn ]
then
	# connected to network but not vpn
	echo " %{F#ae95c7}%{F-} "
else
	# Connected to vpn
	echo "%{F#ae95c7}%{F-} $vpn"
fi
