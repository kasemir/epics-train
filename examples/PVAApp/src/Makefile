TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = PVA


DBD += PVA.dbd

PVA_DBD += base.dbd

# Add these for pvaSrv support
PVA_DBD += dbPv.dbd
PVA_DBD += PVAServerRegister.dbd

PVA_SRCS += PVA_registerRecordDeviceDriver.cpp


PVA_SRCS_DEFAULT += PVAMain.cpp
PVA_SRCS_vxWorks += -nil-

# This line adds pvaSrv
PVA_LIBS += pvaSrv pvAccess pvData $(MBLIB)

PVA_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

