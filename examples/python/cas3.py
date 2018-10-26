# Python CA server and client
import epics
from pcaspy import SimpleServer, Driver

# When using the CA client from threads,
# MUST call this once from the main thread
epics.ca.create_context()
# and then use_initial_context() on each thread.
# For details, see http://cars9.uchicago.edu/software/python/pyepics3/advanced.html#using-python-threads

prefix = 'Python:'
pvdb = {
   'INC' : { 'type' : 'enum', 'enums' : [ 'Idle', 'Inc' ] },
   'DEC' : { 'type' : 'enum', 'enums' : [ 'Idle', 'Dec' ] },
}

class MyDriver(Driver):
    def __init__(self):
        super(MyDriver, self).__init__()
       
        # Set initial values
        self.setParam('INC', 0)
       
    def write(self, reason, value):
        epics.ca.use_initial_context()
        if reason == 'INC':
            if value == 1:
                sp = epics.caget('training:setpoint')
                epics.caput('training:setpoint', sp + 1)
                return True
        elif reason == 'DEC':
            if value == 1:
                sp = epics.caget('training:setpoint')
                epics.caput('training:setpoint', sp - 1)
                return True
        return False

server = SimpleServer()
server.createPV(prefix, pvdb)
driver = MyDriver()

print("Requires the 'fishtank' IOC")
print("Change the fish tank setpoint:")
print("caput Python:INC 1")
print("caput Python:DEC 1")

while True:
    server.process(0.1)

