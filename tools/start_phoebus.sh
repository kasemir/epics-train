#!/bin/sh

export JAVA_HOME=/home/training/epics-train/tools/jdk-11
export PATH=$JAVA_HOME/bin:$PATH
cd ~/epics-train/tools/phoebus-0.0.1


JAR=product-0.0.1.jar

OPT="-settings /home/training/epics-train/tools/phoebus.ini"
# To get one instance, use server mode
#OPT="$OPT -server 4918"

JDK_JAVA_OPTIONS=" -DCA_DISABLE_REPEATER=true"
JDK_JAVA_OPTIONS+=" -Dnashorn.args=--no-deprecation-warning"
JDK_JAVA_OPTIONS+=" -Djdk.gtk.verbose=false -Djdk.gtk.version=2  -Dprism.forceGPU=true"
JDK_JAVA_OPTIONS+=" -Dlogback.configurationFile=/home/training/epics-train/tools/logback.xml"
JDK_JAVA_OPTIONS+=" -Dorg.csstudio.javafx.rtplot.update_counter=false"
export JDK_JAVA_OPTIONS

java -jar $JAR $OPT $SETTINGS "$@" &
