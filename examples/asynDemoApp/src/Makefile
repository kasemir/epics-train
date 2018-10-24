TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

DBD += asynDemo.dbd

LIBRARY_IOC += asynDemoSupport
asynDemoSupport_SRCS += asynDemo.cpp
asynDemoSupport_LIBS += asyn
asynDemoSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

PROD_IOC += asynDemo

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
asynDemo_SRCS_DEFAULT += asynDemo_registerRecordDeviceDriver.cpp asynDemoMain.cpp
asynDemoVx_SRCS_vxWorks  += asynDemo_registerRecordDeviceDriver.cpp
asynDemo_LIBS += asynDemoSupport asyn
asynDemo_LIBS += $(EPICS_BASE_IOC_LIBS)

asynDemo_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
