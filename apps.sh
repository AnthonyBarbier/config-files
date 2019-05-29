#!/bin/bash

sleep 1

#gnome-screensaver &
xscreensaver&
nm-applet &
gnome-session --session=awesome &
#gnome-settings-daemon &
#gnome-power-manager &
#gnome-volume-control-applet &
#alsa-tray &
#checkgmail &
#amsn &
#pidgin&
#tomboy &
#davmail &
skypeforlinux &
thunderbird &
google-chrome &
#volti &
pasystray &
blueman-applet &
spotify&
slack &
#remmina &
mount_eis.sh 
mount_projects.sh 
mount_arm.sh 
mount_oldarm.sh 
monitor-notifications.sh &
/services/start_upload_server.sh &

sleep 2

conky &
pkill -9 indicator-appli
