#!/bin/sh

SETTINGS="-pluginCustomization /home/training/epics-train/tools/css.ini"
~/epics-train/tools/display-runtime/DisplayRuntime -consoleLog "$@" -vmargs -Dorg.osgi.framework.bundle.parent=ext -Dosgi.framework.extensions=org.eclipse.fx.osgi -Dorg.osgi.framework.system.packages.extra=sun.misc >/tmp/display.log 2>&1 &
