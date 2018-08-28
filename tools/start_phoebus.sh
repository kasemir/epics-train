#!/bin/sh

SETTINGS="-settings /home/training/epics-train/tools/phoebus.ini"
export JAVA_HOME=/home/training/epics-train/tools/jdk-10
export PATH=$JAVA_HOME/bin:$PATH
cd ~/epics-train/tools/phoebus-0.0.1
./phoebus.sh $SETTINGS "$@" >/tmp/phoebus.log 2>&1
