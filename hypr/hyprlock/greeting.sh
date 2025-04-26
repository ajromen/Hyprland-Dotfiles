#!/bin/bash

# Set your Username
# username="TamarindX"

# Read the username alias from hyprlock.conf
username=$(grep -oP '^\$USER\s*=\s*\K\S+' ~/.config/hypr/hyprlock.conf)

# Check if the username was successfully extracted
if [ -z "$username" ]; then
  echo "Username not found in hyprlock.conf."
  exit 1
fi

# Get the current hour
hour=$(date +%H)

# Determine the greeting based on the time
if   [ "$hour" -ge 5  ] && [ "$hour" -lt 12 ]; then
    greeting="Dobro Jutro"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 17 ]; then
    greeting="Dobar Dan"
elif [ "$hour" -ge 17 ] && [ "$hour" -lt 21 ]; then
    greeting="Dobro Vece"
else
    greeting="Idi spavaj majumne!"
fi

# Output the combined text
echo -e "Desi, $username! $greeting"
