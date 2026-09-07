#!/usr/bin/env bash
set -euo pipefail

WP_DIR="$HOME/.config/hypr/wallpapers"
TARGET="$HOME/.config/hypr/current.jpg"

shopt -s nullglob
files=("$WP_DIR"/*.{png,jpg,jpeg,webp})
shopt -u nullglob

if [ ${#files[@]} -gt 0 ]; then
    idx=$(( (10#$(date +%j) - 1) % ${#files[@]} ))
    chosen="${files[$idx]}"
    ln -sf "$chosen" "$TARGET"
    if pgrep -x hyprpaper >/dev/null 2>&1; then
        hyprctl hyprpaper wallpaper ",$TARGET,cover" >/dev/null 2>&1 || true
    fi
fi
