#!../../bin/linux-x86_64/PVA

< envPaths

cd "${TOP}"

dbLoadDatabase "dbd/PVA.dbd"
PVA_registerRecordDeviceDriver pdbbase

dbLoadRecords "db/pva_records.db", "user=training"

cd "${TOP}/iocBoot/${IOC}"
iocInit

# Serve all PVs with PVA in addition to CA
startPVAServer
