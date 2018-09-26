# Example for interacting with the 'fishtank' IOC
from time import sleep
from epics import caget, caput, camonitor, camonitor_clear

# The first call actually creates the PV and establishes a 'monitor'
print("Tank temperature is %f" % caget('training:tank'))

# Calling it again just returns the last received value
print("Tank temperature is %f" % caget('training:tank'))

# To force a 'get':
print("Tank temperature is %f" % caget('training:tank', use_monitor=False))


# Caput defaults to fire-and-forget
caput('training:setpoint', 30)

# To use put-callback and await completsion:
caput('training:setpoint', 30, wait=True)


# To receive updates on received values
def handle_value_update(pvname, value, **kw):
    print("%s = %s" % (pvname, str(value)))
    # print("Stuff: " + str(kw))

camonitor('training:tank', callback=handle_value_update)
sleep(5)
camonitor_clear('training:tank')
