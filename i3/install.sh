sudo apt update
sudo apt install -y i3 i3lock i3blocks i3status suckless-tools
sudo apt install pavucontrol pasystray paprefs nm-applet xfce4-power-manager
xfce4-power-manager-settings # Enable systray icon!
#Thunderbird exchangecalendar extension: https://github.com/exchangecalendar/exchangecalendar/releases
# Thunderbird: ExQuilla (Works for exchange): https://addons.thunderbird.net/en-US/thunderbird/addon/exquilla-exchange-web-services/

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
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status/
ln -s `pwd`/config ~/.config/i3/config
ln -s `pwd`/i3status.config ~/.config/i3status/config
for f in `pwd`/bin/*.sh; do ln -s $f ~/bin/; done

# https://github.com/ruudud/i3wm-scripts --> lock on lid close
Additional DNS servers: 10.0.9.1
Addtional search domains: graphcore.ai, ipu.graphcore.ai, bris.graphcore.ai
Routes... -> 10.0.0.0 255.0.0.0 10.0.9.1 25 
Tick Use this connection only for resources on its network
OK
Save


#Not needed: same version as already in Ubuntu
#/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416
# dpkg -i ./keyring.deb
# echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
# apt update
# apt install i3
