#!/bin/bash

MODE_FILE="$HOME/.config/hypr/power_modes/mode.conf"
NORMAL="$HOME/.config/hypr/power_modes/normal.conf"
PERF="$HOME/.config/hypr/power_modes/performance.conf"
KITTY_CONF="$HOME/.config/kitty/kitty.conf"

#remove kitty opaccity
sed -i '/^background_opacity.*/d' "$KITTY_CONF"

if [ "$(readlink $MODE_FILE)" = "$PERF" ]; then
    ln -sf "$NORMAL" "$MODE_FILE"
    echo "background_opacity 0.4" >> "$KITTY_CONF"
    notify-send "Performance Mode OFF"
else
    ln -sf "$PERF" "$MODE_FILE"
    echo "background_opacity 1.0" >> "$KITTY_CONF"
    notify-send "Performance Mode ON"
fi
sleep 0.1
hyprctl reload
pkill -USR1 kitty
