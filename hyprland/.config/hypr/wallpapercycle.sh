#!/bin/bash
set -euo pipefail
DIR="$HOME/Picture/BG/"

while true; do
    pic=$(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | shuf -n 1)
    awww img "$pic" --transition-type simple --transition-duration 2
    ln -sf "$pic" "$HOME/arch_dotfiles/hyprland/.config/hypr/.current_wallpaper"
    sleep 600
done
