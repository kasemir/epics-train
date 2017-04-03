#!../../bin/linux-x86_64/PVA

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/PVA.dbd"
PVA_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords "db/pva_records.db", "user=training"

cd "${TOP}/iocBoot/${IOC}"
iocInit
