#!/bin/sh

SETTINGS="-pluginCustomization /home/training/epics-train/tools/css.ini"
export JAVA_HOME=/home/training/epics-train/tools/jdk-10
export PATH=$JAVA_HOME/bin:$PATH
cd ~/epics-train/tools/phoebus-0.0.1
./phoebus.sh "$@" >/tmp/phoebus.log 2>&1
