#!../../bin/linux-x86_64/asExample1

#- You may have to change asExample1 to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/asExample1.dbd"
asExample1_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords "db/one.db", "S=one"

# ACC SEC
#asSetSubstitutions("S=one")
#asSetFilename("${TOP}/accSec.acf")

cd "${TOP}/iocBoot/${IOC}"
iocInit
