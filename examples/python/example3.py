# Read PV from examples/iocBoot/iocCA, using Channel Access
import pvaccess
c = pvaccess.Channel('training:calcExample', pvaccess.CA)
print(c.get())

