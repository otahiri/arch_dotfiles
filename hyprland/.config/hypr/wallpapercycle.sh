#!/bin/bash
set -euo pipefail
DIR="$HOME/images/BG/"

while true; do
    pic=$(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | shuf -n 1)
    awww img "$pic" --transition-type simple --transition-duration 2
    sleep 600
done
