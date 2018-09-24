#!/usr/bin/python

#
# Simulate a message-based device
#
import SocketServer
import os
import pprint
import random
import sys

def clip(v):
    if (v > 10.0): return 10
    if (v < -10.0): return -10
    return v

status = { }
class DummyDevice(SocketServer.StreamRequestHandler):
    def handle(self):
        global status
        client = self.client_address[0]
        if (status.has_key(client)):
            voltage = status[client]['volts']
            on = status[client]['on']
        else:
            voltage = 0
            on = False
            status[client] = { }
            status[client]['volts'] = voltage
            status[client]['on'] = on
        while True:
            line = self.rfile.readline().strip()
            args = line.split()
            if(len(line) <= 0):
               break
            reply = None
            if (line == '*IDN?'):
                reply = 'US-PAS Instrument, Yoyodyne Incorporated -- An ACME Industries subsidiary, S/N:1313'
            elif (line == 'ON?'):
                reply = '1' if on else '0'
            elif (line == 'VOLTS?'):
                reply = '%.4f' % (voltage)
            elif (line == 'CURR?'):
                ma = voltage + random.gauss(0, 1) if on else 0
                reply = '%.5g' % (ma)
            elif (line == 'LOAD?'):
                load = os.getloadavg()
                reply = '%.5g %.5g %.5g' % (load[0], load[1], load[2])
            elif (len(args) > 1):
                try:
                    val = float(args[1])
                    if (args[0] == 'ON'):
                        if args[1] == '1':
                            on = True
                        elif args[1] == '0':
                            on = False
                    elif (args[0] == 'VOLTS'):
                        voltage = clip(val)
                    status[client]['volts'] = voltage
                    status[client]['on'] = on
                except:
                    pass
            if (reply):
                self.wfile.write(reply + '\r\n')

class Server(SocketServer.ThreadingMixIn, SocketServer.TCPServer):
    daemon_threads = True
    allow_reuse_address = True
    def __init__(self, server_address, RequestHandlerClass):
        SocketServer.TCPServer.__init__(self, server_address, RequestHandlerClass)

server = Server(('0.0.0.0', 24742), DummyDevice)
print("Serving on TCP 24742")
print("Terminate with Ctrl-C")
try:
    server.serve_forever()
except KeyboardInterrupt:
    sys.exit(0)
