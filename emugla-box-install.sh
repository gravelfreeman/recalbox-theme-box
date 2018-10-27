#!/bin/sh
#
# Theme installer script 1.0
# by Nightshade
#
# Change following line for theme repo name
THEMENAME=theme-emulga-box
#
/usr/bin/clear
cd /recalbox/share
curl -s https://api.github.com/repos/Emulga/$THEMENAME/releases/latest | grep 'zipball_url.*zip' | cut -d : -f 2,3 | tr -d \" | tr -d , | wget --no-check-certificate -O /recalbox/share/theme-emulga-box.zip -i -
/usr/bin/unzip theme-emulga-box.zip
cd /recalbox/share/Emulga-theme-emulga-box*
/bin/mount -o remount,rw /
if [ ! -d "/recalbox/share/system/.emulationstation/themes/Emulga Box" ]; then
/bin/echo "Installing Emulga Box Theme..."
/bin/cp -rpv Emulga\ Box /recalbox/share/system/.emulationstation/themes/
else
/bin/echo "Removing old Emulga Box Theme..."
/bin/rm -rfv /recalbox/share/system/.emulationstation/themes/Emulga\ Box
/bin/echo "Installing new Emulga Box Theme..."
/bin/cp -rpv Emulga\ Box /recalbox/share/system/.emulationstation/themes/
fi
/bin/echo "Removing current splash resources..."
/bin/rm -fv /recalbox/system/resources/splash/*
/bin/echo "Installing Emulga Box splash resources..."
/bin/cp -v splash/* /recalbox/system/resources/splash/
/bin/mount -o remount,ro /
/bin/echo "Removing installation resources..."
cd /recalbox/share
rm -rf /recalbox/share/theme-emulga-box.zip /recalbox/share/Emulga-theme-emulga-box*
/bin/echo "Installation complete..."
/bin/echo ""
/bin/echo "Restarting"
/sbin/shutdown -r now
