#!/bin/bash
# Get the serial number of the device
SERIAL_NUMBER=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Set the fully qualified hostname, Bonjour hostname, and computer name
FULL_HOSTNAME="TMG-$SERIAL_NUMBER.bearsden.local"
LOCAL_HOSTNAME="TMG-$SERIAL_NUMBER"
COMPUTER_NAME="TMG-$SERIAL_NUMBER"

sudo scutil --set HostName "$FULL_HOSTNAME"
sudo scutil --set LocalHostName "$LOCAL_HOSTNAME"
sudo scutil --set ComputerName "$COMPUTER_NAME"

# Flush the DNS cache
sudo dscacheutil -flushcache

echo "Fully qualified hostname set to $FULL_HOSTNAME"
echo "Bonjour hostname set to $LOCAL_HOSTNAME"
echo "Computer name set to $COMPUTER_NAME"

defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/vpn.menu"
killall SystemUIServer -HUP
