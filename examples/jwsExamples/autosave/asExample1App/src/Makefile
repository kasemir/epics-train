TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# Build the IOC application
PROD_IOC = asExample1

# asExample1.dbd will be created and installed
DBD += asExample1.dbd

# asExample1.dbd will include these files:
asExample1_DBD += base.dbd

# AUTOSAVE
#asExample1_DBD += asSupport.dbd

# asExample1_registerRecordDeviceDriver.cpp derives from asExample1.dbd
asExample1_SRCS += asExample1_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
asExample1_SRCS_DEFAULT += asExample1Main.cpp
asExample1_SRCS_vxWorks += -nil-

# AUTOSAVE
#asExample1_LIBS += autosave

# Finally link IOC to the EPICS Base libraries
asExample1_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devasExample1Version$(DEP): $(COMMON_DIR)/$(GENVERSION)
