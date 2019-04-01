#!/bin/sh

vpn=$(nmcli | grep "VPN connection" | tail -n 1 | sed "s/\sVPN\sconnection//g")
if [ -z $vpn ]
then
	echo "%{F#ae95c7}%{F-} Disconnected"
else
	echo "%{F#ae95c7}%{F-} $vpn"
fi
