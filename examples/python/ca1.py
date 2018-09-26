# Example for interacting with the 'fishtank' IOC
from time import sleep
from epics import caget, caput

sp = caget('training:setpoint')
rb = caget('training:tank')
print("Temperature setpoint is at %f and tank temperature is %f" % (sp, rb))

if sp < 40:
    caput('training:setpoint', 40)
    print("Changed setpoint to 40...")
    while True:
        rb = caget('training:tank')
        print("Tank temperature is %f" % rb)
        if rb > 39.5:
            break
        sleep(1)
else:        
    caput('training:setpoint', 30)
    print("Changed setpoint to 30...")
    while True:
        rb = caget('training:tank')
        print("Tank temperature is %f" % rb)
        if rb < 30.5:
            break
        sleep(1)
print("Got there, I think")

