#!/bin/sh

/home/training/epics-train/tools/jdk-11/bin/java -cp ~/epics-train/tools/VisualDCT-2.8.1/VisualDCT.jar com.cosylab.vdct.VisualDCT ~/epics-train/tools/ether_ip/dbd/eipIoc.dbd "$@"
