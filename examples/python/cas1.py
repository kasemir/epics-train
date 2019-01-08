# Python CA server

from pcaspy import SimpleServer, Driver
import thread, time, random

prefix = 'Python:'
pvdb = {
    'RANGE' : { 'prec' : 1 },
    'RND'   : { 'prec' : 3, 'unit': 'Ticks', 'hilim': 100 },
}

class MyDriver(Driver):
    def __init__(self):
        super(MyDriver, self).__init__()
       
        # Set initial values
        self.setParam('RANGE', 100)

        # Start process that will update PVs
        thread.start_new_thread(self.process, ())
       
    def write(self, reason, value):
        if reason == 'RANGE':
            # Could check 'value'.
            # Here we accept anything
            self.setParam(reason, value)
            # setParam actually only takes effect
            # after self.updatePVs(),
            # which we call in process()
        else:
            print("No write access to " + reason)
            return False
        return True

    def process(self):
        while True:
            range = self.getParam('RANGE')
            self.setParam('RND', range * random.random())

            self.updatePVs()
            time.sleep(1.0)

server = SimpleServer()
server.createPV(prefix, pvdb)
driver = MyDriver()

print("Try               camonitor Python:RND")
print("Try               caget -d CTRL_DOUBLE Python:RND")
print("Try               caget Python:RND.EGU")
print("Try css 'PV Tree' for Python:RND")
print("Change range via  caput Python:RANGE 10")

while True:
    server.process(0.1)

