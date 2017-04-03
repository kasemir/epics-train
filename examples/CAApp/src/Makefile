TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += CASupport

# Compile and add the code to the support library
CASupport_SRCS += xxxRecord.c
CASupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
# This is required for Windows DLL builds.
CASupport_SRCS += dbSubExample.c
CASupport_SRCS += CAHello.c
CASupport_SRCS += initTrace.c

CASupport_LIBS += $(EPICS_BASE_IOC_LIBS)


# Build the IOC application
PROD_IOC = CA

# CA.dbd will be created and installed
DBD += CA.dbd

# CA.dbd will include these files:
CA_DBD += base.dbd
CA_DBD += xxxSupport.dbd
CA_DBD += dbSubExample.dbd
CA_DBD += CAHello.dbd
CA_DBD += initTrace.dbd

# CA_registerRecordDeviceDriver.cpp derives from CA.dbd
CA_SRCS += CA_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
CA_SRCS_DEFAULT += CAMain.cpp
CA_SRCS_vxWorks += -nil-

# Link in the code from our support library
CA_LIBS += CASupport

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into CASupport
    sncExample_SNCFLAGS += +r
    CA_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    CASupport_SRCS += sncExample.stt
    CASupport_LIBS += seq pv
    CA_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Finally link IOC to the EPICS Base libraries
CA_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

