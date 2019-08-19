sudo apt update
sudo apt install -y i3 i3lock i3blocks i3status suckless-tools
sudo apt install pavucontrol pasystray paprefs nm-applet xfce4-power-manager
xfce4-power-manager-settings # Enable systray icon!
#Thunderbird exchangecalendar extension: https://github.com/exchangecalendar/exchangecalendar/releases

# Start nm-applet / pasystray
# Fix touchpad: https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "TappingButtonMap" "lrm"
        Option "NaturalScrolling" "on"
        Option "ScrollMethod" "twofinger"
EndSection
EOF
cp config ~/.config/i3/config 

# https://github.com/ruudud/i3wm-scripts --> lock on lid close


#Not needed: same version as already in Ubuntu
#/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416
# dpkg -i ./keyring.deb
# echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
# apt update
# apt install i3
