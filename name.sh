#!/bin/bash
# Get the serial number of the device
SERIAL_NUMBER=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

# Set the HostName, LocalHostName, and ComputerName
sudo scutil --set HostName "TMG-$SERIAL_NUMBER"
sudo scutil --set LocalHostName "TMG-$SERIAL_NUMBER"
sudo scutil --set ComputerName "TMG-$SERIAL_NUMBER"

# Get a list of all network services
NETWORK_SERVICES=$(networksetup -listallnetworkservices | tail -n +2)

# Set the search domain for each network service
for SERVICE in $NETWORK_SERVICES; do
    sudo networksetup -setsearchdomains "$SERVICE" "bearsden.local"
done

echo "Device name set to TMG-$SERIAL_NUMBER"
echo "Search domain set to bearsden.local for all network services"
