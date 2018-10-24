#! ../../bin/linux-x86_64/asynDemo

< envPaths

cd $(TOP)
dbLoadDatabase("dbd/asynDemo.dbd")
asynDemo_registerRecordDeviceDriver(pdbbase)

# Turn on asynTraceFlow and asynTraceError for global trace, i.e. no connected asynUser.
#asynSetTraceMask("", 0, 17)

asynDemoConfigure("dev1")

cd $(ASYN)
dbLoadRecords("db/asynRecord.db","P=demo:,R=1,PORT=dev1,ADDR=0,OMAX=80,IMAX=80")

cd $(TOP)
dbLoadRecords("db/asynDemo.db","P=demo:,R=1:,PORT=dev1,ADDR=0,TIMEOUT=1")
#asynSetTraceMask("dev1",0,0xff)
asynSetTraceIOMask("dev1",0,0x2)

cd $(TOP)
iocInit()
