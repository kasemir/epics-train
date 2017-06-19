#!/bin/sh

# Define IP address of your PLC
# and set TAG macro to a numeric controller tag
~/epics-train/tools/ether_ip/bin/linux-x86_64/eipIoc -pplc=192.168.200.82 -m"TAG=Limits6[1]" -d plc1.db
