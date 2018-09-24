#!/usr/bin/python
#
# Simulate a message-based device
# that combines several accelerator components:
#
# Electron gun: BEAM ON
# Corrector Magnets: HCORR x.xxx, VCORR x.xxx
# BPM: BUTTONS?

import SocketServer
import math
import os
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
        SamplingFrequency = 10.0
        HorizontalOffset = 0.1
        VerticalOffset = -0.08
        HorizontalWanderFrequency = 0.1
        HorizontalWanderAmplitude = 0.1
        VerticalWanderFrequency = 0.05
        VerticalWanderAmplitude = 0.05
        CorrectorFullScaleAmps = 10.0
        BeamCurrentFraction = 0.8
        ButtonFullScale = 8192
        client = self.client_address[0]
        if (not status.has_key(client)):
            status[client] = { }
            status[client]['volts'] = 0
            status[client]['on'] = False
            status[client]['beamOn'] = True
            status[client]['simTime'] = 0
            status[client]['hAmps'] = 0.1
            status[client]['vAmps'] = -0.123
        while True:
            line = self.rfile.readline().strip()
            args = line.split()
            if (len(line) <= 0):
               break
            reply = None
            if (line == '*IDN?'):
                reply = 'US-PAS Linac, Yoyodyne Incorporated -- An ACME Industries subsidiary, S/N:1314'
            elif (line == 'BEAM?'):
                reply = '1' if status[client]['beamOn'] else '0'
            elif (line == 'ON?'):
                reply = '1' if status[client]['on'] else '0'
            elif (line == 'VOLTS?'):
                reply = '%.4f' % (status[client]['volts'])
            elif (line == 'CURR?'):
                ma = status[client]['volts'] + random.gauss(0, 1) if status[client]['on'] else 0
                reply = '%.5g' % (ma)
            elif (line == 'LOAD?'):
                load = os.getloadavg()
                reply = '%.5g %.5g %.5g' % (load[0], load[1], load[2])
            elif (line == 'BUTTONS?'):
                if (status[client]['beamOn']):
                    intensity = ButtonFullScale * BeamCurrentFraction
                    p = (2 * status[client]['hAmps'] / CorrectorFullScaleAmps) + HorizontalOffset +  HorizontalWanderAmplitude * math.sin(HorizontalWanderFrequency *  status[client]['simTime'] * 2.0 * math.pi / SamplingFrequency);
                    if (p < -1): p = -1
                    if (p >  1): p =  1
                    hBm = intensity * (1 - p) / 2;
                    hBp = intensity - hBm;
                    p = (2 * status[client]['vAmps'] / CorrectorFullScaleAmps) + VerticalOffset +  VerticalWanderAmplitude * math.sin(VerticalWanderFrequency *  status[client]['simTime'] * 2.0 * math.pi / SamplingFrequency);
                    if (p < -1): p = -1
                    if (p >  1): p =  1
                    vBm = intensity * (1 - p) / 2;
                    vBp = intensity - vBm;
                else:
                    hBm = 0
                    hBp = 0
                    vBm = 0
                    vBp = 0
                status[client]['simTime'] += 1.0
                reply = '%d,%d,%d,%d' % (hBm, hBp, vBm, vBp)
            elif (len(args) > 1):
                try:
                    if (args[0] == 'BEAM'):
                        if (args[1] == 'ON'):
                            status[client]['beamOn'] = True
                        elif args[1] == 'OFF':
                            status[client]['beamOn'] = False
                    else:
                        val = float(args[1])
                        if (args[0] == 'ON'):
                            if args[1] == '1':
                                status[client]['on'] = True
                            elif args[1] == '0':
                                status[client]['on'] = False
                        elif (args[0] == 'VOLTS'):
                            status[client]['volts'] = clip(val)
                        elif (args[0] == 'HCORR'):
                            status[client]['hAmps'] = clip(val)
                        elif (args[0] == 'VCORR'):
                            status[client]['vAmps'] = clip(val)
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
