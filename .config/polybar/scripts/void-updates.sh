#!/bin/sh

updates=$(xbps-install -Mun 2>/dev/null | wc -l)

if [ -n "$updates" ] && [ "$updates" -gt 0 ]; then

	echo "%{F#aec795}%{F-} $updates"

else

	echo ""

fi
