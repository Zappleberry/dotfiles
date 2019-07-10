#!/bin/sh

if [ -z "$(pgrep -x transmission-da)" ]
then
	echo " down"
else
	transmission-remote -l | grep % | sed "
	s/.*Stopped.*/A/g;
	s/.*Seeding.*/Z/g;
	s/.*100%.*/N/g;
	s/.*Idle.*/B/g;
	s/.*Uploading.*/L/g;
	s/.*%.*/M/g" |
	sort -h | uniq -c | sed " # Now we replace the standin letters with icons.
				s/A/%\{F#aec795\}%\{F-\}/g;
				s/B/%\{F#aec795\}%\{F-\}/g;
				s/L/%\{F#aec795\}%\{F-\}/g;
				s/M/%\{F#aec795\}%\{F-\}/g;
				s/N/%\{F#aec795\}%\{F-\}/g;
				s/Z/%\{F#aec795\}%\{F-\}/g" | awk '{print $2, $1}' | tr '\n' ' ' | sed -e "s/ $//g"
fi
