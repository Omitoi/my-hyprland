#!/usr/bin/env bash
# Clipboard history picker via cliphist and rofi

SELECTED=$(cliphist list | rofi -dmenu -theme ~/.config/rofi/cliphist.rasi -p "󰅌 Clipboard:")

if [ -n "$SELECTED" ]; then
    echo "$SELECTED" | cliphist decode | wl-copy
fi
