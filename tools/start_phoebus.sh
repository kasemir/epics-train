#!/bin/sh

export JAVA_HOME=/home/training/epics-train/tools/jdk-10
export PATH=$JAVA_HOME/bin:$PATH
cd ~/epics-train/tools/phoebus-0.0.1


JAR=product-0.0.1.jar

OPT="-settings /home/training/epics-train/tools/phoebus.ini"
# To get one instance, use server mode
#OPT="$OPT -server 4918"

java --add-modules=java.corba -jar $JAR $OPT $SETTINGS "$@" 
