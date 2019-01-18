#!../../bin/linux-x86_64/sequencer

#- You may have to change sequencer to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/sequencer.dbd"
sequencer_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords "db/one.db", "S=one"

#- Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
seq sncExample, "S=one"
