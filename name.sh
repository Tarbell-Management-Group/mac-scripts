#!/bin/bash
# Get the serial number of the device
SERIAL_NUMBER=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Set the HostName, LocalHostName, and ComputerName
sudo scutil --set HostName "TMG-$SERIAL_NUMBER"
sudo scutil --set LocalHostName "TMG-$SERIAL_NUMBER"
sudo scutil --set ComputerName "TMG-$SERIAL_NUMBER"

echo "Device name set to TMG-$SERIAL_NUMBER"
