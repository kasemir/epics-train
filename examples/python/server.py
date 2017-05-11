# Example of pvAccess Server in Python
#
# Requires updated pvaPy 0.7.0, see updatePvaPy.sh

from time import sleep
from pvaccess import PvObject, INT, PvaServer

print("This serves pva://pair")
print("")
print("Try")
print("   pvinfo pair")
print("")

pv = PvObject({'x': INT, 'y' : INT})

server = PvaServer('pair', pv)

x = 1
while True:
    pv['x'] = x
    pv['y'] = 2*x
    sleep(1)
    x = x + 1



