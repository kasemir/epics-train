# Python CA server
#
# Serves command as Python:CMD which supports put-callback
# Provides value via Python:RBV

from pcaspy import SimpleServer, Driver
import thread, time, random

prefix = 'Python:'
pvdb = {
    'CMD' : { 'type' : 'enum', 'enums' : [ 'Idle', 'Run' ], 'asyn' : True },
    'RBV' : { 'prec' : 3 },
}

class MyDriver(Driver):
    def __init__(self):
        super(MyDriver, self).__init__()
       
        # Set initial values
        self.setParam('CMD', 0)
        self.setParam('RBV', 0)

        self.thread = None

    def write(self, reason, value):
        if reason == 'CMD':
            if value == 1:
                self.setParam('CMD', 1)
                self.thread = thread.start_new_thread(self.run, ())
                return True
        return False

    def run(self):
        print("Running...")
        self.updatePVs()

        time.sleep(4.0)

        self.setParam('RBV', self.getParam('RBV') + 1)
        self.setParam('CMD', 0)
        self.updatePVs()
        print("Done.")
        self.callbackPV('CMD')
        
        self.thread = None

server = SimpleServer()
server.createPV(prefix, pvdb)
driver = MyDriver()

print("Try    camonitor Python:CMD Python:RBV")
print("then   caput -c -w 10 Python:CMD 1")

while True:
    server.process(0.1)

