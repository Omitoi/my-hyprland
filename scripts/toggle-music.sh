#!/usr/bin/env bash
# Toggle spotify-player in the dedicated music scratchpad workspace

if ! hyprctl clients -j 2>/dev/null | jq -e '.[] | select(.class == "spotify-player")' > /dev/null; then
    kitty --class spotify-player -e spotify_player &
    sleep 0.2
fi

hyprctl eval "hl.dispatch(hl.dsp.workspace.toggle_special('music'))"
