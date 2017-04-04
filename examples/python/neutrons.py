# Read PV EPICSV4Sandbox/neutronsDemoServer
import pvaccess
c = pvaccess.Channel('neutrons')

custom = c.get("field()")

print(custom)

p_charge = custom['proton_charge']['value']
pixels = custom['pixel']['value']

print("Last pulse had a charge of %g Coulomb" % p_charge)
print("The detector was hit at these pixels IDs:")
print( str(pixels))