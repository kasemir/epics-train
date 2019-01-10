#!/bin/sh

export JAVA_HOME=/home/training/epics-train/tools/jdk-11
export PATH=$JAVA_HOME/bin:$PATH

TOP=/home/training/epics-train/tools
JAR=archive-engine-0.0.1/service-archive-engine-0.0.1.jar

cd $TOP
java -jar $JAR "$@"
