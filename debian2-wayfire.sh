git clone https://git.launchpad.net/ubuntu/+source/wayland wayland-ubuntu
git clone https://gitlab.freedesktop.org/wayland/wayland wayland-upstream
cp -r wayland-ubuntu/debian wayland-upstream

sudo apt-get build-dep wayland
sudo apt install gcc g++ meson ninja debhelper dh-make

dh_auto_configure --buildsystem=meson
dpkg-buildpackage -rfakeroot -us -uc -b

git clone https://github.com/WayfireWM/wayfire && cd wayfire
dh_make --createorig -p wayfire_0.8.0
dh_auto_configure --buildsystem=meson
dpkg-buildpackage -rfakeroot -us -uc -b
ls ../*.deb
../wayfire_0.8.0-1_amd64.deb

sudo add-apt-repository ppa:soreau/wayfirewm
sudo apt-get update
sudo apt install wayfire wayfire-plugins-extra wf-shell wcm xwayland

sudo apt install ppa-purge
sudo ppa-purge ppa:soreau/wayfirewm

sudo apt install git python3-pip pkg-config libwayland-dev autoconf libtool libffi-dev libxml2-dev libegl1-mesa-dev libgles2-mesa-dev libgbm-dev libinput-dev libxkbcommon-dev libpixman-1-dev xutils-dev xcb-proto python-xcbgen libcairo2-dev libglm-dev libjpeg-dev libgtkmm-3.0-dev xwayland

pip3 install meson ninja; . ~/.profile

xport prefix=/opt/wayfire
export PATH=$prefix/bin:$PATH
export PKG_CONFIG_PATH=$prefix/lib/pkgconfig:$prefix/share/pkgconfig:$prefix/lib/x86_64-linux-gnu/pkgconfig

sudo mkdir $prefix; sudo chown $USER:$USER $prefix
mkdir ~/src; cd ~/src

git clone https://gitlab.freedesktop.org/wayland/wayland
git clone git://anongit.freedesktop.org/wayland/wayland-protocols
git clone git://anongit.freedesktop.org/xcb/libxcb
git clone https://github.com/swaywm/wlroots
git clone https://github.com/WayfireWM/wayfire
git clone https://github.com/WayfireWM/wf-shell
git clone https://github.com/WayfireWM/wcm

cd ~/src/wayland && ./autogen.sh --prefix=$prefix --disable-documentation && make && make install

cd ~/src/wayland-protocols && ./autogen.sh --prefix=$prefix && make && make install

cd ~/src/libxcb && ./autogen.sh --prefix=$prefix && make && make install

cd ~/src/wlroots && meson build --prefix=$prefix && ninja -C build && ninja -C build install

cd ~/src/wayfire && meson build --prefix=$prefix && ninja -C build && ninja -C build install

cd ~/src/wf-shell && meson build --prefix=$prefix && ninja -C build && ninja -C build install

cd ~/src/wcm && meson build --prefix=$prefix && ninja -C build && ninja -C build install

cp ~/src/wayfire/wayfire.ini.default ~/.config/wayfire.ini
cp ~/src/wf-shell/wf-shell.ini.example ~/.config/wf-shell.ini
sed -i 's/env XDG_CURRENT_DESKTOP=GNOME gnome-control-center/wcm/' ~/.config/wf-shell.ini

8) Save this script as /usr/local/bin/wayfire.

#!/bin/bash

prefix=/opt/wayfire
log_file=/tmp/wayfire.log

export PATH="$prefix"/bin:$PATH
export XDG_DATA_DIRS="$prefix"/share:$XDG_DATA_DIRS
export GTK_THEME=Adwaita:dark
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export LD_LIBRARY_PATH="$prefix"/lib:"$prefix"/lib/x86_64-linux-gnu/
exec "$prefix"/bin/wayfire "$@" &> "$log_file"
8b) Make it executable.

$ sudo chmod +x /usr/local/bin/wayfire
9) Run it.

$ /usr/local/bin/wayfire
9b) Open an application. Either run a native terminal,

WAYLAND_DISPLAY=wayland-0 GDK_BACKEND=wayland terminator
or an X11 one.

DISPLAY=:1 xterm
10) Optionally switch to tty to use the drm backend. Make sure your user is part of the video group to run as user.

sudo adduser $USER video
11) Optionally create /usr/share/wayland-sessions/wayfire.desktop to login from lightdm.

[Desktop Entry]
Version=1.0
Name=Wayfire Session
Comment=Use this session to run Wayfire as your desktop environment
Exec=/usr/local/bin/wayfire
Type=Application
Firefox nightly should work as a native browser. Ctrl+Alt+Bckspc to log out. Any questions should be asked in #wayfire on irc.freenode.net or an issue filed on github for the relevant component. To remove the compiled packages and source, remove /opt/wayfire/, ~/src/, /usr/local/bin/wayfire and /usr/share/wayland-sessions/wayfire.desktop. Checkout wayfire.org for more information.



