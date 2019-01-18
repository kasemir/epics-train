TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# Build the IOC application
PROD_IOC = sequencer

# sequencer.dbd will be created and installed
DBD += sequencer.dbd

# sequencer.dbd will include these files:
sequencer_DBD += base.dbd

# sequencer_registerRecordDeviceDriver.cpp derives from sequencer.dbd
sequencer_SRCS += sequencer_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
sequencer_SRCS_DEFAULT += sequencerMain.cpp
sequencer_SRCS_vxWorks += -nil-

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into sequencerSupport
    sncExample_SNCFLAGS += +r
    sequencer_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    sequencer_SRCS += sncExample.stt
    sequencer_LIBS += seq pv

    ## Build sncProgram as a standalone program
    #PROD_HOST += sncProgram
    #sncProgram_SNCFLAGS += +m
    ## A .st sequence program *is* pre-processed:
    #sncProgram_SRCS += sncProgram.st
    #sncProgram_LIBS += seq pv
    #sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    sequencer_LIBS += qsrv
    sequencer_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    sequencer_DBD += PVAServerRegister.dbd
    sequencer_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
sequencer_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devsequencerVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
