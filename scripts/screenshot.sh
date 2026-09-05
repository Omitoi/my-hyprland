#!/usr/bin/env bash
# Screenshot helper: copies to clipboard, saves to ~/Pictures/Screenshots, and notifies

TARGET_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$TARGET_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILE="$TARGET_DIR/Screenshot_${TIMESTAMP}.png"

MODE="${1:-area}"

case "$MODE" in
    "area")
        grimblast copysave area "$FILE"
        ;;
    "screen")
        grimblast copysave output "$FILE"
        ;;
    "window")
        grimblast copysave active "$FILE"
        ;;
    *)
        grimblast copysave area "$FILE"
        ;;
esac

if [ -f "$FILE" ]; then
    notify-send -a "Screenshot" -i "$FILE" "Screenshot Saved" "Copied to clipboard and saved to:\n$FILE"
fi
