# Monitor PV from examples/iocBoot/iocExample
import pvaccess, time
c = pvaccess.Channel('training:calc1')

def echo(value):
    print("Received " + str(value))

c.subscribe('echo', echo)
c.startMonitor()

time.sleep(5)

c.stopMonitor()
c.unsubscribe('echo')

