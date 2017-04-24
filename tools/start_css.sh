#!/bin/sh

gconftool-2 --type boolean --set /desktop/gnome/interface/menus_have_icons true
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/ButtonImages': <1>, 'Gtk/MenuImages': <1>}"

SETTINGS="-pluginCustomization /home/training/epics-train/tools/css.ini"
LINKS="-share_link /home/training/epics-train/examples=/examples"
XMI=""
if [ -f ~/default.xmi ]
then
    echo "Using ~/default.xmi"
    XMI="-workbench_xmi $HOME/default.xmi"
fi
~/epics-train/tools/CSS/css $XMI $SETTINGS $LINKS >/tmp/css.log 2>&1 &

