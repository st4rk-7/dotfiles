#!/bin/sh
# The album art code comes from tam-carre's ncmpcpp-ueberzug script
# https://github.com/tam-carre/ncmpcpp-ueberzug

# SETTINGS
music_library="$HOME/Music"
fallback_image="${XDG_DATA_HOME:-$HOME/.local/share}/icons/fallback-cover.png"
timeout=5000

mpc idleloop player | while read -r line; do

    # Check if there's no song playing
    if ! mpc current | read REPLY; then
        notify-send -t "$timeout" -u normal -i "audio-x-generic" \
            -h string:x-canonical-private-synchronous:mpd-notification \
            "MPD Notification" "Stopped Playback"
        continue
    fi

    # Song info for later use
    title="$(mpc --format %title% current)"
    album="$(mpc --format %album% current)"
    artist="$(mpc --format %artist% current)"
    state="$(mpc status %state% | sed -e 's/\b\(.\)/\u\1/')"

    # Find the album art of the current playing song
    # First we look inside the music file's directory
    file="$(mpc --format %file% current)"
    album_dir="$music_library/${file%/*}"
    top_dir="$music_library/${file%%/*}"

    while :; do
        found_covers="$(find "$album_dir" -maxdepth 1 -type f -iregex \
            ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\\(jpe?g\|png\|gif\|bmp\)")"
        [ -n "$found_covers" ] || [ "$album_dir" = "$top_dir" ] && break
        album_dir="${album_dir%/*}"
    done
    cover_path="$(echo "$found_covers" | head -n1)"

    # If nothing was found, check if the audio file has an embedded album art
    if [ -z "$cover_path" ]; then
        ext="$(mpc --format %file% current | sed 's/^.*\.//')"
        if [ "$ext" = "flac" ]; then
            # since FFMPEG cannot export embedded FLAC art we use metaflac
            metaflac --export-picture-to=/tmp/tmp_cover.jpg \
                "$(mpc --format "$music_library"/%file% current)" >/dev/null 2>&1 &&
                cover_path="/tmp/tmp_cover.jpg"
        else
            ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" \
                /tmp/tmp_cover.jpg >/dev/null 2>&1 &&
                cover_path="/tmp/tmp_cover.jpg"
        fi
    fi

    # If we still failed to find a cover image, we use the fallback
    if [ -z "$cover_path" ]; then
        cover_path=$fallback_image
    fi

    # Send the notification and clean temporary files
    notify-send -t "$timeout" -u normal -i "$cover_path" \
        -h string:x-canonical-private-synchronous:mpd-notification \
        "MPD Notification" "$state <b>$title</b>\nby $artist\nfrom $album"
    [ -f /tmp/tmp_cover.jpg ] && rm -f /tmp/tmp_cover.jpg
done
