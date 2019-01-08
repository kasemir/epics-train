#!/bin/sh

export JAVA_HOME=/home/training/epics-train/tools/jdk-11
export PATH=$JAVA_HOME/bin:$PATH
cd ~/epics-train/tools/phoebus-0.0.1


JAR=product-0.0.1.jar

OPT="-settings /home/training/epics-train/tools/phoebus.ini"
OPT+=" -Djdk.gtk.version=2"
# To get one instance, use server mode
#OPT="$OPT -server 4918"

java -Dlogback.configurationFile=/home/training/epics-train/tools/logback.xml -Dprism.forceGPU=true -Dorg.csstudio.javafx.rtplot.update_counter=false -Djdk.gtk.version=3 -jar $JAR $OPT $SETTINGS "$@" &
