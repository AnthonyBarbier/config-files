#!/bin/bash

set_a2dp() {
index=`pacmd list-cards | grep bluez_card -B1 | grep index | awk '{print $2}'`;pacmd set-card-profile $index off; pacmd set-card-profile $index a2dp_sink
}

move_streams() {
index=`pacmd list-cards | grep bluez_card -B1 | grep index | awk '{print $2}'`;
pacmd set-default-sink $index
for input in `pacmd list-sink-inputs | grep index | awk '{print $2}'`; do
  pacmd move-sink-input $input $index
done
}

set_a2dp

bluetoothctl << EOF
disconnect CC:98:8B:AF:27:35
EOF
sleep 5

bluetoothctl << EOF
connect CC:98:8B:AF:27:35
EOF

sleep 5

set_a2dp

move_streams
