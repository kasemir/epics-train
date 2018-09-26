# Lower level API
import time, epics

# Create 3 PVs
pv1 = epics.get_pv('training:setpoint')
pv2 = epics.get_pv('training:room')
pv3 = epics.get_pv('training:sensor')

# Assert that we're connected
if not (pv1.wait_for_connection(5.0) and
        pv2.wait_for_connection(5.0) and
        pv3.wait_for_connection(5.0)):
    raise Exception("No luck")

# Submit 3 put-callbacks
pv1.put(30, use_complete=True)
pv2.put(25, use_complete=True)
pv3.put(0, use_complete=True)

# Wait for all of them to complete
while not (pv1.put_complete and
           pv2.put_complete and
           pv3.put_complete):
    time.sleep(0.5)

# Close PVs
pv1.disconnect()
pv2.disconnect()
pv3.disconnect()

