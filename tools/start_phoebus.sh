#!/bin/sh

export JAVA_HOME=/home/training/epics-train/tools/jdk-10
export PATH=$JAVA_HOME/bin:$PATH
cd ~/epics-train/tools/phoebus-0.0.1


JAR=product-0.0.1.jar

OPT="-settings /home/training/epics-train/tools/phoebus.ini"
# To get one instance, use server mode
#OPT="$OPT -server 4918"

java -Dlogback.configurationFile=/home/training/epics-train/tools/logback.xml -Dprism.forceGPU=true -Dorg.csstudio.javafx.rtplot.update_counter=false --add-modules=java.corba -jar $JAR $OPT $SETTINGS "$@" &
