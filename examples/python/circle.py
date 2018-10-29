# Read PV from 'makeBaseApp.pl -t example'
# (start_iocExample)
# to check if circle.x and .y are on circle
#
# For faster updates,
#   caput training:circle:period 0.01
 
import pvaccess, time
from math import sqrt

c = pvaccess.Channel('training:circle')

custom = c.get("field()")
print("Custom data structure:")
print(custom)

def check(value):
    x = value['x']['value']
    y = value['y']['value']
    print("%+.4f %+.4f -> %.8f" % (x, y, sqrt(x*x + y*y)))

c.subscribe('check', check)
c.startMonitor()

time.sleep(10000)

c.stopMonitor()
c.unsubscribe('check')

