# Read PV from examples/iocBoot/iocPVA
import pvaccess
c = pvaccess.Channel('training:ramp')
print(c.get())

