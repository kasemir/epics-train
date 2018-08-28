# Read PV from examples/iocBoot/iocExample
import pvaccess
c = pvaccess.Channel('training:calc1')
print(c.get())

