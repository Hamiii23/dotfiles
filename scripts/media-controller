#!/usr/bin/env bash

MAX=25

STATUS=$(playerctl status 2>/dev/null || echo "Stopped")

if [ "$STATUS" = "Playing" ]; then
    ICON=" "
elif [ "$STATUS" = "Paused" ]; then
    ICON=" "
else
    ICON=" "
fi

TITLE=$(playerctl metadata title 2>/dev/null || echo "")

if [ -z "$TITLE" ]; then
    TITLE="Nothing Playing"
fi

if [ ${#TITLE} -gt $MAX ]; then
    TITLE="${TITLE:0:$MAX}…"
fi

echo "$ICON $TITLE"
