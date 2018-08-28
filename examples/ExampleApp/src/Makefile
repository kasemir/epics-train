TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += ExampleSupport

# Compile and add code to the support library
ExampleSupport_SRCS += xxxRecord.c
ExampleSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
ExampleSupport_SRCS += dbSubExample.c
ExampleSupport_SRCS += devExampleVersion.c
ExampleSupport_SRCS += ExampleHello.c
ExampleSupport_SRCS += initTrace.c

ExampleSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = ExampleVersion.h
# Macro name
GENVERSIONMACRO = ExampleVERSION

# Build the IOC application
PROD_IOC = Example

# Example.dbd will be created and installed
DBD += Example.dbd

# Example.dbd will include these files:
Example_DBD += base.dbd
Example_DBD += xxxSupport.dbd
Example_DBD += dbSubExample.dbd
Example_DBD += devExampleVersion.dbd
Example_DBD += ExampleHello.dbd
Example_DBD += initTrace.dbd

# Example_registerRecordDeviceDriver.cpp derives from Example.dbd
Example_SRCS += Example_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
Example_SRCS_DEFAULT += ExampleMain.cpp
Example_SRCS_vxWorks += -nil-

# Link in the code from our support library
Example_LIBS += ExampleSupport

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into ExampleSupport
    sncExample_SNCFLAGS += +r
    Example_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    ExampleSupport_SRCS += sncExample.stt
    ExampleSupport_LIBS += seq pv
    Example_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    Example_LIBS += qsrv
    Example_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    Example_DBD += PVAServerRegister.dbd
    Example_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
Example_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devExampleVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
