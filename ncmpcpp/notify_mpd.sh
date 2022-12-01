#!/bin/bash

music_library="$HOME/data/Music"

fallback_image="~/.config/ncmpcpp/cover.jpg"

ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" /tmp/mpd_cover.jpg > /dev/null 2>&1 && \

notify-send -i /tmp/mpd_cover.jpg "Now Playing:" "$(mpc current)" || \

notify-send -i $fallback_image "Now Playing:" "$(mpc current)"
