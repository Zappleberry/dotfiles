#!/bin/sh

if [ -z "$(pgrep offlineimap)" ]
then
	# not syncing
	echo ""
else
	# syncing
	echo "%{F#aec795}%{F-}"
fi
