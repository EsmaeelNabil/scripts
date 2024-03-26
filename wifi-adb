#!/bin/bash

# Set the ADB port for TCP mode (customize if needed)
ADB_PORT=5555

# Check if ADB is available
if ! command -v adb &>/dev/null; then
    echo "ADB command not found. Please install the Android SDK Platform Tools."
    exit 1
fi

# Get a list of connected devices
device_list=$(adb devices | tail -n +2)

if [ -z "$device_list" ]; then
    echo "No connected Android devices found."
    exit 1
fi

# Display the list of devices
echo "Available devices:"
i=1
for device in $device_list; do
    echo "[$i] $device"
    i=$((i + 1))
done

# Prompt the user to select devices
echo -n "Enter the number(s) of the device(s) to connect to (separated by spaces): "
read -r device_numbers

# Connect to the selected devices
for device_num in $device_numbers; do
    device_id=$(echo $device_list | awk -v num=$device_num 'NR==num {print $1}')

    ip_address=$(adb -s $device_id shell ip -f inet addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)

    if [ -z "$ip_address" ]; then
        echo "Error: Could not determine IP address for device $device_id"
        continue  # Skip to the next device
    fi

    adb -s $device_id tcpip "$ADB_PORT"
    adb connect "$ip_address:$ADB_PORT"

    echo "Connected to $device_id at $ip_address:$ADB_PORT"
done
