#!/usr/bin/env bash
D="$HOME/.config/hypr/Wallpapers"
C="$HOME/.config/hypr/hyprpaper.conf"
[ ! -d "$D" ] && { notify-send "Error" "Dir not found"; exit 1; }
W=$(find "$D" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sort)
[ -z "$W" ] && { notify-send "Error" "No wallpapers found"; exit 1; }
S=$(echo "$W" | sed 's|.*/||;s|\.[^.]*$||' | rofi -dmenu -i -p "")
[ -z "$S" ] && exit 0
P=$(echo "$W" | grep "/$S\.")
[ -z "$P" ] && { notify-send "Error" "Not found"; exit 1; }
echo -e "\$PATH = $P\npreload = \$PATH\nwallpaper = , \$PATH" > "$C"
pkill hyprpaper 2>/dev/null; sleep 0.5; hyprpaper &
