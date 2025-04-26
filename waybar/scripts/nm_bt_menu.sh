#!/bin/bash

choice=$(echo -e "Wi-Fi\nBluetooth" | wofi --dmenu --prompt="Choose:" --width=300)

case "$choice" in
  "Wi-Fi")
    # Directly execute networkmanager_dmenu using Wofi without backend prompt
    export DMENU="wofi --dmenu --prompt='Wi-Fi:' --width=400"
    networkmanager_dmenu
    ;;
  "Bluetooth")
    # Launch Bluetooth manager in alacritty
    alacritty -e bluetuith
    ;;
  *)
    exit 1
    ;;
esac

