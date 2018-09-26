# Invoked from ~/.bashrc as
#   source /home/training/epics-train/settings.sh

# In the past, a file like this contained all the settings.
#
# To simplify maintenance, that has been split into
# several profile.d/*.sh
# which are all parsed here in alphabetical order
for i in $HOME/epics-train/tools/profile.d/*.sh
do
    source $i
done

