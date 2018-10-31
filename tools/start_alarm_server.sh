#!/bin/sh

export JAVA_HOME=/home/training/epics-train/tools/jdk-10
export PATH="$JAVA_HOME/bin:$PATH"

V="0.0.1"

JAR="service-alarm-server-${V}.jar"

cd //home/training/epics-train/tools/alarm-server-0.0.1
java --add-modules=java.corba -jar $JAR "$@"
