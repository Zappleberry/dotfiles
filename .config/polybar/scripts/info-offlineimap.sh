#!/bin/sh

newmail=$(du -a ~/.mail/*/INBOX/new/* 2>/dev/null | sed -n '$=')

syncing=""
[ -n "$(pgrep -l offlineimap)" ] && syncing="%{F#aec795}%{F-}"

[ -z "$newmail" ] && echo "$syncing" && exit

[ -n "$syncing" ] && syncing=" $syncing"

echo "%{F#aec795}%{F-} $newmail$syncing"

