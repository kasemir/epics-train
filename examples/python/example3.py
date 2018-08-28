# Read PV from examples/iocBoot/iocExample, using Channel Access
import pvaccess
c = pvaccess.Channel('training:calc1', pvaccess.CA)
print(c.get())

