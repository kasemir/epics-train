
alias phoebus=~/epics-train/tools/start_phoebus.sh
alias css=~/epics-train/tools/start_phoebus.sh
alias archive_engine=~/epics-train/tools/start_archive_engine.sh
alias alarm_server=~/epics-train/tools/start_alarm_server.sh

alias start_iocfishtank="cd /home/training/epics-train/examples/Display\ Builder/fishtank; sh st.cmd"
alias toggle_fishtank="while true; do caput training:setpoint 60; sleep 60; caput training:setpoint 25; sleep 60; done"
