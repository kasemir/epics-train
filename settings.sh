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
export JAVA_HOME=`echo $HOME/epics-train/tools/jdk1.8.0_*`
#export PYTHONPATH=$EPICS_BASE4/pvaPy/lib/python/2.7/linux-x86_64
export PYTHONPATH=$HOME/epics-train/tools/pvaPy/lib/python/2.7/linux-x86_64

export SWT_GTK3=0

export PATH=$EPICS_BASE4/pvAccessCPP/bin/linux-x86_64:$EPICS_BASE/bin/$EPICS_HOST_ARCH:$JAVA_HOME/bin:/home/training/bin:$HOME/epics-train/tools/ether_ip/bin/linux-x86_64:$PATH

xinput set-prop "VirtualBox mouse integration" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1.0
xinput set-prop "VirtualBox mouse integration" "Coordinate Transformation Matrix" 1.0 0 0 0 1.0 0 0 0 1.0

alias css=~/epics-train/tools/start_css.sh
alias start_display=~/epics-train/tools/start_display.sh
alias start_iocCA="cd ~/epics-train/examples/iocBoot/iocCA; ./st.cmd"
alias start_iocPVA="cd ~/epics-train/examples/iocBoot/iocPVA; ./st.cmd"
alias start_iocfishtank="cd ~/CSS-Workspaces/Default/Display\ Builder/fishtank; sh st.cmd"
alias start_imagedemo="~/epics-train/tools/EPICSV4Sandbox/ntndarrayServer/bin/linux-x86_64/ntndarrayServerMain IMAGE"
alias start_neutrondemo="~/epics-train/tools/EPICSV4Sandbox/neutronsDemoServer/bin/linux-x86_64/neutronServerMain"
alias vdct="java -cp ~/epics-train/tools/VisualDCT/2.6.1274/VisualDCT.jar com.cosylab.vdct.VisualDCT ~/epics-train/tools/eipIoc_3.14.12.6.dbd"

