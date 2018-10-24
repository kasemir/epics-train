/* asynDemo.h
 * 
 * Based on asyn4-33/testAsynPortDriverApp
 */

#include "asynPortDriver.h"

/* Parameter names */
#define P_RangeString         "RANGE"         /* asynFloat64,  r/w */
#define P_UpdateTimeString    "UPDATE_TIME"   /* asynFloat64,  r/w */
#define P_ValueString         "VALUE"         /* asynFloat64,  r/o */

/** Class that demonstrates the use of the asynPortDriver base class.
 *
 *  Generates 'VALUE' within the 'RANGE'.
 */
class asynDemo : public asynPortDriver
{
public:
    asynDemo(const char *portName);
                 
    /* Methods that we override from asynPortDriver */
    virtual asynStatus writeFloat64(asynUser *pasynUser, epicsFloat64 value);

    /* Methods that are new to this class */
    void simTask(void);

protected:
    /** Values used for pasynUser->reason, and indices into the parameter library. */
    int P_Range;
    int P_UpdateTime;
    int P_Value;
 
private:
    /* Our data */
    epicsEventId eventId_;
};
