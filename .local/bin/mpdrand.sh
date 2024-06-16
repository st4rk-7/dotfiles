#!/bin/sh

# This is basically mpdq (https://github.com/uriel1998/mpdq) with very basic features.
# Sort of a "party mode" that will only be active with repeat and random off and consume on.
# When a song finishes playing, a new random one will be added.

QUEUE=5 # the max number of songs that the playlist will have

[ -x "$(command -v mpc)" ] || exit 1

# Check if there's already an open instance.
for pid in $(pidof -x "$(basename "$0")"); do
    if [ "$pid" != $$ ]; then
        printf "%s\n" "Already running." >&2
        exit 1
    fi
done

while :; do
    # If MPD is not set to repeat: off, random: off, and consume: on, just wait for the next idle loop
    pauseme=$(mpc status [%repeat%%random%%consume%])
    if [ "$pauseme" = "offoffon" ]; then
        playlist_length="$(mpc playlist | wc -l)"
        while [ "$playlist_length" -lt "$QUEUE" ]; do
            mpc listall | shuf -n 1 | mpc add
            playlist_length="$((playlist_length + 1))"
        done
    fi
    mpc idle player options
done
