#!/bin/bash

# Set the directory for your backgrounds
BACKGROUND_DIR="$HOME/.config/backgrounds"

# List of background files
BACKGROUND_FILES=(
    "$BACKGROUND_DIR/background0.jpg"
    "$BACKGROUND_DIR/background1.jpg"
    "$BACKGROUND_DIR/background2.jpg"
    "$BACKGROUND_DIR/background3.jpg"
)

# Function to set a random background
set_random_background() {
    # Pick a random background from the list
    RANDOM_BG="${BACKGROUND_FILES[$RANDOM % ${#BACKGROUND_FILES[@]}]}"

    # Use hyprpaper to set the background
    hyprpaper background "$RANDOM_BG"
}

# Monitor idle time using hypridle
while true; do
    # Wait for the idle time to be greater than a specified threshold (e.g., 600 seconds for 10 minutes)
    if hypridle -t 600; then
        # If idle for 10 minutes, change the background
        set_random_background
    fi
done
