#!../../bin/linux-x86_64/Combined

< envPaths

cd "${TOP}"

dbLoadDatabase "dbd/Combined.dbd"
Combined_registerRecordDeviceDriver pdbbase

dbLoadRecords "first_steps/first.db", "S=training"

# PLC Example
drvEtherIP_init()
# Enable with actual PLC IP and example tag
#drvEtherIP_define_PLC("plc", "192.168.200.82", 0)
#dbLoadRecords "plc/plc1.db","TAG=Limits6[1]"


# Configure autosave
epicsEnvSet SAVE_DIR /tmp
set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")
set_pass1_restoreFile("combined.sav")

cd "${TOP}/iocBoot/${IOC}"
iocInit

# Serve all PVs with PVA in addition to CA
startPVAServer

# Create autosave request file
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/combined.req", "autosaveFields")
# Save changes every 10 seconds
create_monitor_set("combined.req", 10)
