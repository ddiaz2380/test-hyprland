#!/bin/sh
#
# debian.sh
# A script to configure Debian
#
# Copyright (C) 2021 Daniel Diaz
#
# THIS SCRIPT IS LICENSED UNDER THE MIT LICENSE.
#

#
# - Install recommended packages
# - Install development packages (optional)
# - Install Network Manager (optional)
# - Install Printer tools and drivers (optional)
# - Install the X Window System (optional)
# - Install a Desktop Environment (optional)
# - Install a Window Manager (optional)
# - Install Network Manager graphical tools
# - Choose a Display manager (optional)
# - Install a Web browser (optional)
# - Install a Terminal emulator (optional)
# - Install an Office suite (optional)
# - Install an code editor (optional)
#

echo
echo "-----------------------"
echo "Check for updates..."
echo "-----------------------"
echo

sudo apt update

echo
echo "----------------------------------"
echo "Install recommended packages..."
echo "----------------------------------"
echo

sudo apt install sudo apt-transport-https vim nano curl wget man-db manpages manpages-posix \
	ca-certificates bluez bluez-tools pulseaudio pulseaudio-module-bluetooth \
	pulseaudio-module-zeroconf avahi-daemon avahi-discover avahi-dnsconfd \

echo
echo "\n>> DONE"

##
##
##

echo
echo "--------------------"
echo "Development Tools"
echo "--------------------"
echo

read -p "Do you want to install development tools? (y/n) " devtools
case $devtools in
	y )

	sudo apt install autoconf automake bison m4 make gcc g++ libtool gdb meson ninja-build \
		sassc optipng parallel

	echo "\n>> DONE"

	;;

	n ) continue ;;
esac

##
##
##

echo
echo "--------------------------"
echo "Install Network Manager"
echo "--------------------------"
echo

read -p "Do you want to install Network Manager? (y/n) " networkmanager
case $networkmanager in
	y )

	echo
	echo "-----------------------------"
	echo "Install Network Manager..."
	echo "-----------------------------"
	echo

	sudo apt install network-manager network-manager-openvpn network-manager-openconnect \
		network-manager-l2tp network-manager-vpnc

	echo
	echo "\n>> DONE"

	;;

	n ) continue ;;
esac

##
##
##

echo
echo "------------------------------------"
echo "Install Printer tools and drivers"
echo "------------------------------------"
echo

read -p "Do you want to install Printer tools and drivers? (y/n) " printer
case $printer in
	y )

	echo
	echo "----------------------------------"
	echo "Install CUPS and Printer drivers"
	echo "----------------------------------"
	echo

	sudo apt install cups cups-pk-helper foomatic-db foomatic-db-engine printer-driver-all \
		hplip

	echo
	echo "\n>> DONE"

	;;

	n ) continue ;;
esac

##
##
##

echo
echo "----------------------"
echo "The X Window System"
echo "----------------------"
echo ""
echo "The X Window System (X11) is a windowing system and provides the basic framework for a graphical\n
environment like KDE Plasma or XFCE.\n"

read -p "Do you want to install the X Window System to configure a graphical environment? (y/n) " xwinsys
case $xwinsys in
	y ) 

	echo
	echo "---------------------------------"
	echo "Install the X Window System..."
	echo "---------------------------------"
	echo

	sudo apt install xserver-xorg-core x11-xserver-utils x11-session-utils xinit

	echo "\n>> DONE"

	##
	##
	##

	echo
	echo "--------------------------------"
	echo "Install a Desktop Environment"
	echo "--------------------------------"
	echo ""
	echo "Possible options:\n
	- 1 Xfce
	- 2 MATE
	- 3 LXQt
	- 4 Cinnamon
	- 5 Enlightenment
	- 6 None\n"

	read -p "Which desktop environment do you want to install? (enter number) " desktop
	case $desktop in
		1 ) 

		echo
		echo "------------------"
		echo "Install Xfce..."
		echo "------------------"
		echo

		sudo apt install xfce4-panel xfce4-settings xfce4-session xfwm4 xfdesktop4 xfce4-terminal xfce4-taskmanager \
			xfce4-whiskermenu-plugin xfce4-battery-plugin xfce4-datetime-plugin xfce4-dict xfce4-clipman-plugin \
			xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-diskperf-plugin xfce4-places-plugin \
			xfce4-mount-plugin xfce4-power-manager xfce4-power-manager-plugins xfce4-appmenu-plugin \
			xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-indicator-plugin xfce4-mailwatch-plugin \
			xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-sntray-plugin xfce4-statusnotifier-plugin \
			xfce4-xkb-plugin thunar thunar-volman thunar-archive-plugin thunar-media-tags-plugin tumbler \
			tumbler-plugins-extra ristretto parole mousepad gvfs-backends xarchiver

		echo "\n>> DONE"
			
		;;
		
		2 ) 

		echo
		echo "------------------"
		echo "Install MATE..."
		echo "------------------"
		echo

		sudo apt install mate-applet-appmenu mate-applet-brisk-menu mate-applets mate-calc mate-control-center \
			mate-desktop mate-dock-applet mate-icon-theme mate-indicator-applet mate-media mate-menu \
			mate-menus mate-notification-daemon mate-panel mate-polkit mate-power-manager \
			mate-screensaver mate-session-manager mate-settings-daemon mate-sntray-plugin \
			mate-system-monitor mate-terminal mate-themes mate-tweak mate-user-share mate-utils \
			pluma engrampa atril eom caja caja-image-converter caja-mediainfo caja-rename caja-share \
			caja-sendto caja-wallpaper caja-xattr-tags caja-open-terminal caja-actions caja-admin \
			caja-gtkhash caja-nextcloud gvfs-backends
		
		echo "\n>> DONE"
			
		;;

		3 )

		echo
		echo "------------------"
		echo "Install LXQt..."
		echo "------------------"
		echo

		sudo apt install lxqt-about lxqt-about-l10n lxqt-admin lxqt-admin-l10n lxqt-archiver lxqt-archiver-l10n \
			lxqt-branding-debian lxqt-config lxqt-config-l10n lxqt-globalkeys lxqt-globalkeys-l10n \
			lxqt-notificationd lxqt-notificationd-l10n lxqt-openssh-askpass lxqt-openssh-askpass-l10n \
			lxqt-panel lxqt-panel-l10n lxqt-policykit lxqt-policykit-l10n lxqt-powermanagement lxqt-powermanagement-l10n \
			lxqt-qtplugin lxqt-runner lxqt-runner-l10n lxqt-session lxqt-session-l10n lxqt-sudo lxqt-sudo-l10n \
			lxqt-system-theme lxqt-theme-debian lxqt-themes pcmanfm-qt pcmanfm-qt-l10n lximage-qt lximage-qt-l10n \
			pavucontrol-qt pavucontrol-qt-l10n openbox obconf-qt obconf-qt-l10n featherpad featherpad-l10n

		echo "\n>> DONE"

		;;

		4 )

		echo
		echo "------------------------"
		echo "Install Cinnamon..."
		echo "------------------------"
		echo

		sudo apt install cinnamon-core gnome-system-monitor gnome-disk-utility evince eog eog-plugins \
			file-roller gedit gedit-plugins gvfs-backends

		echo "\n>> DONE"

		;;

		5 )

		echo
		echo "---------------------------"
		echo "Install Enlightenment..."
		echo "---------------------------"
		echo

		sudo apt install enlightenment terminology ephoto mousepad evince xarchiver

		echo "\n>> DONE"

		;;
		
		6 ) continue ;;
	esac

	##
	##
	##

	echo
	echo "---------------------------"
	echo "Install a Window manager"
	echo "---------------------------"
	echo ""
	echo "Possible options:\n
	- 1 i3wm
	- 2 bspwm
	- 3 Awesome
	- 4 JWM
	- 5 IceWM
	- 6 DWM
	- 7 None\n"

	read -p "Which window manager do you want to install? (enter number) " windowman
	case $windowman in
		1 ) 

		echo
		echo "------------------"
		echo "Install i3wm..."
		echo "------------------"
		echo

		sudo apt install i3-wm i3blocks i3status i3lock dmenu dunst feh nitrogen mousepad

		echo "\n>> DONE"
			
		;;
		
		2 ) 

		echo
		echo "-------------------"
		echo "Install bspwm..."
		echo "-------------------"
		echo

		sudo apt install bspwm sxhkd dunst feh mousepad
		
		echo "\n>> DONE"
			
		;;

		3 )

		echo
		echo "---------------------"
		echo "Install Awesome..."
		echo "---------------------"
		echo

		sudo apt install awesome awesome-extra dunst feh nitrogen mousepad

		echo "\n>> DONE"

		;;

		4 )

		echo
		echo "-----------------"
		echo "Install JWM..."
		echo "-----------------"
		echo

		sudo apt install jwm dunst feh nitrogen mousepad

		echo "\n>> DONE"

		;;

		5 )

		echo
		echo "-------------------"
		echo "Install IceWM..."
		echo "-------------------"
		echo

		sudo apt install icewm dunst feh nitrogen mousepad

		echo "\n>> DONE"

		;;

		6 )

		echo
		echo "-----------------"
		echo "Install DWM..."
		echo "-----------------"
		echo

		sudo apt install dwm dunst feh nitrogen mousepad

		echo "\n>> DONE"

		;;
		
		7 ) continue ;;
	esac

	##
	##
	##

	echo
	echo "---------------------------------------------"
	echo "Install Network Manager graphical tools..."
	echo "---------------------------------------------"
	echo

	if [ -d /etc/NetworkManager ]; then
		sudo apt install network-manager-l2tp-gnome network-manager-openconnect-gnome \
			network-manager-openvpn-gnome network-manager-vpnc-gnome

		echo "\n>> DONE"
	fi

	##
	##
	##

	echo
	echo "---------------------------"
	echo "Choose a Display manager"
	echo "---------------------------"
	echo ""
	echo "Possible options:\n
	- 1 LightDM (GTK)
	- 2 SDDM (Qt)
	- 3 None\n"

	read -p "Which display manager do you want to use to login? (enter number) " disman
	case $disman in
		1 ) 

		echo
		echo "---------------------"
		echo "Install LightDM..."
		echo "---------------------"
		echo

		sudo apt install lightdm lightdm-gtk-greeter

		echo "\n>> DONE"
			
		;;
		
		2 ) 

		echo
		echo "------------------"
		echo "Install SDDM..."
		echo "------------------"
		echo

		sudo apt install sddm
		
		echo "\n>> DONE"
			
		;;
		
		3 ) continue ;;
	esac

	##
	##
	##

	echo
	echo "------------------------"
	echo "Install a Web browser"
	echo "------------------------"
	echo ""
	echo "Possible options:\n
	- 1 Firefox ESR
	- 2 Vivaldi
	- 3 Brave
	- 4 Falkon
	- 5 Epiphany
	- 6 None\n"

	read -p "Which web browser do you want to install? (enter number) " webbrowser
	case $webbrowser in
		1 ) 

		echo
		echo "-------------------------"
		echo "Install Firefox ESR..."
		echo "-------------------------"
		echo

		sudo apt install firefox-esr firefox-esr-l10n-de

		echo "\n>> DONE"
			
		;;
		
		2 ) 

		echo
		echo "---------------------"
		echo "Install Vivaldi..."
		echo "---------------------"
		echo

		wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg
		echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/sudo apt/sources.list.d/vivaldi-archive.list
		sudo apt update && sudo apt install vivaldi-stable

		echo "\n>> DONE"
			
		;;
		
		3 ) 

		echo
		echo "-------------------"
		echo "Install Brave..."
		echo "-------------------"
		echo

		sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
		echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
		sudo apt update
		sudo apt install brave-browser
		
		echo "\n>> DONE"
			
		;;

		4 )

		echo
		echo "--------------------"
		echo "Install Falkon..."
		echo "--------------------"
		echo

		sudo apt install falkon

		echo "\n>> DONE"

		;;

		5 )

		echo
		echo "----------------------"
		echo "Install Epiphany..."
		echo "----------------------"
		echo

		sudo apt install epiphany-browser

		echo "\n>> DONE"

		;;
		
		6 ) continue ;;
	esac

	##
	##
	##

	echo
	echo "------------------------------"
	echo "Install a Terminal emulator"
	echo "------------------------------"
	echo ""
	echo "Possible options:\n
	- 1 XFCE Terminal
	- 2 MATE Terminal
	- 3 GNOME Terminal
	- 4 LXTerminal
	- 5 None\n"

	read -p "Which terminal emulator do you want to install? (enter number) " terminal
	case $terminal in
		1 ) 

		echo
		echo "---------------------------"
		echo "Install XFCE Terminal..."
		echo "---------------------------"
		echo

		sudo apt install xfce4-terminal

		echo "\n>> DONE"
			
		;;

		2 )

		echo
		echo "---------------------------"
		echo "Install MATE Terminal..."
		echo "---------------------------"
		echo

		sudo apt install mate-terminal

		echo "\n>> DONE"

		;;

		3 )

		echo
		echo "----------------------------"
		echo "Install GNOME Terminal..."
		echo "----------------------------"
		echo

		sudo apt install gnome-terminal

		echo "\n>> DONE"

		;;

		4 )

		echo
		echo "------------------------"
		echo "Install LXTerminal..."
		echo "------------------------"
		echo

		sudo apt install lxterminal

		echo "\n>> DONE"

		;;
		
		5 ) continue ;;
	esac

	##
	##
	##

	echo
	echo "--------------------------"
	echo "Install an Office suite"
	echo "--------------------------"
	echo ""
	echo "Possible options:\n
	- 1 LibreOffice
	- 2 None\n"

	read -p "Which office suite do you want to install? (enter number) " office
	case $office in
		1 ) 

		echo
		echo "-------------------------"
		echo "Install LibreOffice..."
		echo "-------------------------"
		echo

		sudo apt install libreoffice-writer libreoffice-calc libreoffice-impress \
			libreoffice-draw libreoffice-math libreoffice-base libreoffice-gtk3 \
			libreoffice-l10n-de libreoffice-help-en-us libreoffice-help-de

		echo "\n>> DONE"
			
		;;
		
		2 ) continue ;;
	esac

	##
	##
	##

	echo
	echo "------------------------"
	echo "Install a code editor"
	echo "------------------------"
	echo ""
	echo "Possible options:\n
	- 1 Geany
	- 2 Bluefish
	- 3 Emacs
	- 4 None\n"

	read -p "Which code editor do you want to install? (enter number) " codeedit
	case $codeedit in
		1 ) 

		echo
		echo "-------------------"
		echo "Install Geany..."
		echo "-------------------"
		echo

		sudo apt install geany geany-plugins

		echo "\n>> DONE"
			
		;;
		
		2 ) 

		echo
		echo "----------------------"
		echo "Install Bluefish..."
		echo "----------------------"
		echo

		sudo apt install bluefish bluefish-plugins

		echo "\n>> DONE"
			
		;;

		3 )

		echo
		echo "-------------------"
		echo "Install Emacs..."
		echo "-------------------"
		echo

		sudo apt install emacs

		echo "\n>> DONE"

		;;
		
		4 ) continue ;;
	esac
		
	;;
	
	n ) continue ;;
esac

##
##
##

echo "\nCONFIGURATION FINISHED"
echo "PLEASE REBOOT YOUR DEVICE"
