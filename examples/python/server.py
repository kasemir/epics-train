# Example of pvAccess Server in Python

from time import sleep
from pvaccess import PvObject, INT, PvaServer

print("This serves pva://pair")
print("")
print("Try")
print("   pvinfo pair")
print("   pvget -m -r \"x, y\" pair")
print("")
print("or open examples/displays/PVA_Server.bob")
print("")

pv = PvObject({'x': INT, 'y' : INT})

server = PvaServer('pair', pv)

x = 1
while True:
    pv['x'] = x
    pv['y'] = 2*x
    print(x, 2*x)
    server.update(pv)
    sleep(1)
    x = x + 1



