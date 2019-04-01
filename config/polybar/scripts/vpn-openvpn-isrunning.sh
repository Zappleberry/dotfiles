#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
    echo "Connected"
else
    echo "Disconnected"
fi
