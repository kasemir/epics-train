#!../../bin/linux-x86_64/asExample1

#- You may have to change asExample1 to something else
#- everywhere it appears in this file

< envPaths

# AUTOSAVE
#epicsEnvSet IOCNAME ioc1
#epicsEnvSet SAVE_DIR /tmp

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/asExample1.dbd"
asExample1_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords "db/one.db", "S=one"

################## AUTOSAVE ##################
#cd ${AUTOSAVE}
## Optional database for autosave status
#dbLoadRecords "db/save_restoreStatus.db", "P=$(IOCNAME):"
#
#save_restoreSet_status_prefix("$(IOCNAME):")
#set_requestfile_path("$(SAVE_DIR)")
#set_savefile_path("$(SAVE_DIR)")
#
#save_restoreSet_NumSeqFiles(3)
#save_restoreSet_SeqPeriodInSeconds(30)
## Arrange for restoring saved values into records
#set_pass1_restoreFile("$(IOCNAME).sav")
################## AUTOSAVE ##################

cd "${TOP}/iocBoot/${IOC}"
iocInit

################## AUTOSAVE ##################
## Create request file and start periodic 'save’
#makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME).req","autosaveFields")
#
#create_monitor_set("$(IOCNAME).req",5)
################## AUTOSAVE ##################
