/* asynDemo.cpp
 * 
 * Based on asyn4-33/testAsynPortDriverApp
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <math.h>

#include <epicsTypes.h>
#include <epicsTime.h>
#include <epicsThread.h>
#include <epicsString.h>
#include <epicsTimer.h>
#include <epicsMutex.h>
#include <epicsEvent.h>
#include <iocsh.h>

#include "asynDemo.h"
#include <epicsExport.h>

static const char *driverName="asynDemo";
void simTask(void *drvPvt);

/** Constructor, calls asynPortDriver base constructor.
 *  \param[in] portName The name of the asyn port driver to be created.
 */
asynDemo::asynDemo(const char *portName) 
   : asynPortDriver(portName, 
                    1, /* maxAddr */ 
                    asynFloat64Mask | asynDrvUserMask, /* Interface mask */
                    asynFloat64Mask,  /* Interrupt mask */
                    0, /* asynFlags.  This driver does not block and it is not multi-device, so flag is 0 */
                    1, /* Autoconnect */
                    0, /* Default priority */
                    0) /* Default stack size*/    
{
    asynStatus status;
    const char *functionName = "asynDemo";

    eventId_ = epicsEventCreate(epicsEventEmpty);
    createParam(P_RangeString,              asynParamFloat64,       &P_Range);
    createParam(P_UpdateTimeString,         asynParamFloat64,       &P_UpdateTime);
    createParam(P_ValueString,              asynParamFloat64,       &P_Value);
    
    /* Set the initial values of some parameters */
    setDoubleParam (P_Range,       100.0);
    setDoubleParam (P_UpdateTime,    0.5);
    setDoubleParam (P_Value,         0.0);
    
    /* Create the thread that computes the waveforms in the background */
    status = (asynStatus)(epicsThreadCreate("asynDemoTask",
                          epicsThreadPriorityMedium,
                          epicsThreadGetStackSize(epicsThreadStackMedium),
                          (EPICSTHREADFUNC)::simTask,
                          this) == NULL);
    if (status)
        printf("%s:%s: epicsThreadCreate failure\n", driverName, functionName);
}


/* C API for the C++ simTask() method */
void simTask(void *drvPvt)
{
    asynDemo *pPvt = (asynDemo *)drvPvt;
    pPvt->simTask();
}

/** Simulation task that runs as a separate thread. */
void asynDemo::simTask(void)
{
    double updateTime, range, value;
    
    lock();
    while (1)
    {
        getDoubleParam(P_UpdateTime, &updateTime);
        // Release the lock while we wait for updateTime
        // Usually this just delays for updateTime seconds,
        // but when the updateTime parameter is changed,
        // we wake ASAP
        unlock();
        epicsEventWaitWithTimeout(eventId_, updateTime);
        lock(); 

        getDoubleParam(P_Range, &range);
        getDoubleParam(P_Value, &value);

        value += 1;
        if (value > range)
            value = 0.0;

        updateTimeStamp();
        setDoubleParam(P_Value, value);
        callParamCallbacks();
    }
}

/** Called when asyn clients call pasynFloat64->write().
 *  Only overridden to show that one could react to write access.
 */
asynStatus asynDemo::writeFloat64(asynUser *pasynUser, epicsFloat64 value)
{
    asynStatus status = asynPortDriver::writeFloat64(pasynUser, value);
    if (pasynUser->reason == P_Range)
        printf("Range changed to %lf\n", value);
    else if (pasynUser->reason == P_UpdateTime)
    {
        printf("Update time changed to %lf sec\n", value);
        // Wake simTask ASAP
        epicsEventSignal(eventId_);
    }
    return status;
}


/* EPICS boilerplate for registering 'asynDemoConfigure(portName') in IOC shell */

extern "C"
{

int asynDemoConfigure(const char *portName)
{
    new asynDemo(portName);
    return(asynSuccess);
}

static const iocshArg initArg0 = { "portName",iocshArgString};
static const iocshArg * const initArgs[] = {&initArg0};
static const iocshFuncDef initFuncDef = {"asynDemoConfigure",1,initArgs};
static void initCallFunc(const iocshArgBuf *args)
{
    asynDemoConfigure(args[0].sval);
}

void asynDemoRegister(void)
{
    iocshRegister(&initFuncDef,initCallFunc);
}

epicsExportRegistrar(asynDemoRegister);

}

