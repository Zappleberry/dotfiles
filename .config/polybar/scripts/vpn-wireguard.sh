#!/bin/sh

vpn=$(wg show interfaces | head -n 1)
connected=$(nmcli d | awk '{print $3}' | grep connected | grep -v disconnected)

if [ -z "$vpn" ] && [ -z "$connected" ]
then
	# not connected to network or vpn
	echo ""
elif [ -z "$vpn" ]
then
	# connected to network but not vpn
	echo " %{F#ae95c7}%{F-} "
else
	# Connected to vpn
	echo "%{F#ae95c7}%{F-} $vpn"
fi
