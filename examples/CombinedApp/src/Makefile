TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = Combined


DBD += Combined.dbd

Combined_DBD += base.dbd

# Add these for pvaSrv support
Combined_DBD += dbPv.dbd
Combined_DBD += PVAServerRegister.dbd

# Add these for ether_ip
Combined_DBD += ether_ip.dbd

# Add these for autosave
Combined_DBD += asSupport.dbd

Combined_SRCS += Combined_registerRecordDeviceDriver.cpp


Combined_SRCS_DEFAULT += CombinedMain.cpp
Combined_SRCS_vxWorks += -nil-

# This line adds pvaSrv
Combined_LIBS += pvaSrv pvAccess pvData $(MBLIB)

# ether_ip
Combined_LIBS += ether_ip

# autosave
Combined_LIBS += autosave

Combined_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

