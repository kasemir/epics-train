# Python CA server

from pcaspy import SimpleServer, Driver
import thread, time, random

prefix = 'Python:'
pvdb = {
    'RAMP'   : { 'prec' : 3, 'unit': 'Ticks' },
}

class MyDriver(Driver):
    def __init__(self):
        super(MyDriver, self).__init__()
       
        # Set initial values
        self.setParam('RAMP', 0)

        # Start process that will update PVs
        thread.start_new_thread(self.process, ())
       
    def process(self):
        while True:
            val = self.getParam('RAMP')
            self.setParam('RAMP', val + 1)
            self.updatePVs()
            # time.sleep(0.1)

server = SimpleServer()
server.createPV(prefix, pvdb)
driver = MyDriver()

print("Try               camonitor Python:RAMP")

while True:
    server.process(0.1)

