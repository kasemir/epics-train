# Add this to ~/.bashrc:
#
# source ~/epics-train/settings.sh

export EPICS_BASE=$HOME/epics-train/tools/base-3.15.5
export EPICS_BASE4=$HOME/epics-train/tools/EPICS-CPP-4.6.0
export EPICS_HOST_ARCH=linux-x86_64
# Possible addresses on VM: 127.0.0.1 10.0.2.15 10.0.2.255 192.168.122.255
# 127.0.0.1 "works", but only for one IOC
# After disabling the firewall, 10.0.2.255 is good
export EPICS_CA_ADDR_LIST="10.0.2.255"
export EPICS_CA_AUTO_ADDR_LIST=NO
export EPICS_PVA_ADDR_LIST="10.0.2.15"
export EPICS_PVA_AUTO_ADDR_LIST=NO
export JAVA_HOME=$HOME/epics-train/tools/jdk1.8.0_121

export PATH=$EPICS_BASE4/pvAccessCPP/bin/linux-x86_64:$EPICS_BASE/bin/$EPICS_HOST_ARCH:$JAVA_HOME/bin:/home/training/bin:$PATH

xinput set-prop "VirtualBox mouse integration" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1.0
xinput set-prop "VirtualBox mouse integration" "Coordinate Transformation Matrix" 1.0 0 0 0 1.0 0 0 0 1.0
gconftool-2 --type boolean --set /desktop/gnome/interface/menus_have_icons true

alias css="~/epics-train/tools/basic-epics-4.2.0/css -pluginCustomization /home/training/epics-train/tools/css.ini -share_link ~/epics-train/examples=/examples >/tmp/css.log 2>&1 &"

