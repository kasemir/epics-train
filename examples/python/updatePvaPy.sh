#!/bin/sh
#
# Update pvaPy to 0.7.0

if [ ! -d /home/training/epics-train/tools/pvaPy-0.7.0/lib/python/2.7/linux-x86_64 ]
then
    echo "Downloading and compiling pvaPy 0.7.0"
    ( cd ~/epics-train/tools
      wget https://github.com/epics-base/pvaPy/archive/0.7.0.zip
      unzip 0.7.0.zip
      rm 0.7.0.zip
      cd pvaPy-0.7.0
      make configure EPICS_BASE=$EPICS_BASE EPICS4_DIR=$EPICS_BASE4
      make
    )
fi

echo "Using pvaPy 0.7.0"
export PYTHONPATH=/home/training/epics-train/tools/pvaPy-0.7.0/lib/python/2.7/linux-x86_64

