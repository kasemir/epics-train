export EPICS_BASE=$HOME/epics-train/tools/base-7.0.2
export EPICS_HOST_ARCH=linux-x86_64
# Possible addresses on VM: 127.0.0.1 10.0.2.15 10.0.2.255 192.168.122.255
# 127.0.0.1 "works", but only for one IOC
# After disabling the firewall, 10.0.2.255 is good
export EPICS_CA_ADDR_LIST="10.0.2.255"
export EPICS_CA_AUTO_ADDR_LIST=NO
export EPICS_PVA_ADDR_LIST="10.0.2.15"
export EPICS_PVA_AUTO_ADDR_LIST=NO

export PATH=$EPICS_BASE/bin/$EPICS_HOST_ARCH:$PATH

