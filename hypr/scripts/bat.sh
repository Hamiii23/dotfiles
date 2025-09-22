#!/usr/bin/env bash

export PATH=$PATH:/usr/bin:/bin
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

is_charger_connected() {
    for supply in /sys/class/power_supply/A{C,DP}* /sys/class/power_supply/*; do
        if [[ -f "$supply/online" ]]; then
            if [[ $(cat "$supply/online" 2>/dev/null) == "1" ]]; then
                return 0  # Connected
            fi
        fi
    done
    return 1  # Not connected
}

# Function to get battery percentage
get_battery_percentage() {
    for battery in /sys/class/power_supply/BAT*; do
        if [[ -f "$battery/capacity" ]]; then
            cat "$battery/capacity" 2>/dev/null
            return
        fi
    done
    echo "0"
}

# Function to send notification
notify() {
    local title="$1"
    local message="$2"
    local icon="$3"
    
    notify-send -i "$icon" "$title" "$message"
}

# Initialize previous states
previous_state=""
battery_20_notified=false
battery_80_notified=false

# Main monitoring loop
while true; do
    battery_level=$(get_battery_percentage)
    
    # Check charger connection/disconnection
    if is_charger_connected; then
        current_state="connected"
        if [[ "$previous_state" != "connected" ]]; then
            notify "Charger Connected" "Power adapter plugged in" "battery-full-charged"
            battery_20_notified=false
        fi
    else
        current_state="disconnected"
        if [[ "$previous_state" != "disconnected" && "$previous_state" != "" ]]; then
            notify "Charger Disconnected" "Power adapter unplugged" "battery-caution"
            battery_80_notified=false
        fi
    fi
    
    # Battery level notifications
    if [[ "$battery_level" -le 20 && "$battery_20_notified" == false ]]; then
        if ! is_charger_connected; then
            notify "Low Battery" "Battery is at ${battery_level}%. Please connect charger" "battery-low"
            battery_20_notified=true
        fi
    elif [[ "$battery_level" -gt 20 ]]; then
        battery_20_notified=false
    fi
    
    if [[ "$battery_level" -ge 80 && "$battery_80_notified" == false ]]; then
        if is_charger_connected; then
            notify "Battery Full" "Battery is at ${battery_level}%. Consider disconnecting charger" "battery-full"
            battery_80_notified=true
        fi
    elif [[ "$battery_level" -lt 80 ]]; then
        battery_80_notified=false
    fi
    
    previous_state="$current_state"
    sleep 2
done
