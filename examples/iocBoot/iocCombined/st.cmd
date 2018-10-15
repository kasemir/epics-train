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

# Stream Device Example
#epicsEnvSet("STREAM_PROTOCOL_PATH", "../../CombinedApp/Db")
#drvAsynIPPortConfigure("SI", "127.0.0.1:24742")
#dbLoadRecords("db/si_stream.db")


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


# Log some asyn info and in/out texts
# Configure this _after_ database starts,
# values are otherwise reset to defaults
# ASYN_TRACE_ERROR     0x0001
# ASYN_TRACEIO_DEVICE  0x0002
# ASYN_TRACEIO_FILTER  0x0004
# ASYN_TRACEIO_DRIVER  0x0008
# ASYN_TRACE_FLOW      0x0010
#asynSetTraceMask("SI", -1, 0x9)

# ASYN_TRACEIO_NODATA 0x0000
# ASYN_TRACEIO_ASCII  0x0001
# ASYN_TRACEIO_ESCAPE 0x0002
# ASYN_TRACEIO_HEX    0x0004
#asynSetTraceIOMask("SI", -1, 0x2)

