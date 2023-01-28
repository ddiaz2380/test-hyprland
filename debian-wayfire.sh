sudo apt install git meson python3-pip pkg-config libwayland-dev autoconf libtool libffi-dev libxml2-dev libegl1-mesa-dev libgles2-mesa-dev libgbm-dev libinput-dev libxkbcommon-dev libpixman-1-dev xutils-dev xcb-proto python3-xcbgen libcairo2-dev libglm-dev libjpeg-dev libgtkmm-3.0-dev xwayland libdrm-dev libgirepository1.0-dev libsystemd-dev policykit-1 libx11-xcb-dev libxcb-xinput-dev libxcb-composite0-dev xwayland libasound2-dev libpulse-dev

git clone https://github.com/WayfireWM/wf-install
cd wf-install

./install.sh --prefix /opt/wayfire --stream 0.7.x
