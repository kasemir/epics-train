TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = CombinedVersion.h
# Macro name
GENVERSIONMACRO = CombinedVERSION

# Build the IOC application
PROD_IOC = Combined

# Combined.dbd will be created and installed
DBD += Combined.dbd

# Combined.dbd will include these files:
Combined_DBD += PVAServerRegister.dbd
Combined_DBD += base.dbd
Combined_DBD += qsrv.dbd

# Add these for ether_ip
Combined_DBD += ether_ip.dbd

# Add these for autosave
Combined_DBD += asSupport.dbd

# Add these for stream device (and asyn)
Combined_DBD += stream.dbd
Combined_DBD += asyn.dbd
Combined_DBD += drvAsynIPPort.dbd

# Add these for the busy record (also needs asyn)
Combined_DBD += busySupport.dbd


# Combined_registerRecordDeviceDriver.cpp derives from Combined.dbd
Combined_SRCS += Combined_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
Combined_SRCS_DEFAULT += CombinedMain.cpp
Combined_SRCS_vxWorks += -nil-

Combined_LIBS += qsrv
Combined_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)

# ether_ip
Combined_LIBS += ether_ip

# autosave
Combined_LIBS += autosave

# stream
Combined_LIBS += asyn
Combined_LIBS += stream

# busy
Combined_LIBS += busy

# Finally link IOC to the EPICS Base libraries
Combined_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devCombinedVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
