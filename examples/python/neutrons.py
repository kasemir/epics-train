# Read PV from EPICSV4Sandbox/neutronsDemoServer
import pvaccess
c = pvaccess.Channel('neutrons')

# By default, the Channel will request "field(value"),
# which is not valid for this custom structure and
# would result in "PvaClientGet::connect invalid pvRequest".
# Fetch all elements:
custom = c.get("field()")
# Could also configure the channel to fetch selected
# elements of the structure:
# custom = c.get("field(proton_charge, pixel)")

print("Custom data structure:")
print(custom)

# Acts as a python dictionary
p_charge = custom['proton_charge']['value']
pixels = custom['pixel']['value']

print("Last pulse had a charge of %g Coulomb" % p_charge)
print("The detector was hit at these pixels IDs:")
print( str(pixels))
