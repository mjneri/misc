#!/bin/bash

# For setting up RealVNC Server and xrdp on Steam Deck.
# Run using 'source holo_vncserver_xrdp_setup.sh'
# NOTE: For package dependency issues, try searching the package in https://archlinux.org/packages/ and installing its dependencies first.
# Make sure to setup the pacman keys first - see steamdeck_pacman.sh

if [[ $0 =~ ".sh" ]]; then
  echo "Usage: source ./setup.sh <tag version>"
  echo "Example: source ./setup.sh 2022.10"
  return 1
fi

# Mandatory:
sudo steamos-readonly disable

# Remove existing folders from previous installation
sudo rm -rf ./xrdp
sudo rm -rf ./realvnc-vnc-server

# Install fakeroot since this is needed to build RealVNC server
sudo pacman -S fakeroot 

# Build and install RealVNC Server
git clone https://aur.archlinux.org/realvnc-vnc-server.git && cd realvnc-vnc-server
makepkg -s 
#sudo pacman -U realvnc-vnc-server-7.6.1-1-x86_64.pkg.tar.zst  
sudo pacman -U `find *.tar.zst`

# Enable the systemd service
sudo systemctl enable vncserver-x11-serviced 
sudo systemctl start vncserver-x11-serviced 

# Build and install xrdp
cd ..
git clone https://aur.archlinux.org/xrdp.git && cd xrdp

# Install all dependencies needed to build xrdp (yeah, it's a LOT.)
sudo pacman -S patch autoconf automake pkg-config gcc base-devel glibc linux-api-headers pam libjpeg-turbo \
opus lame libx11 libxfixes lib32-libxfixes libxrandr libxv libxpresent xorg-util-macros xorgproto libxext \
libxrender openssl fuse2 fuse3 libfdk-aac pixman x264 --noconfirm

# Delete existing files
sudo rm /etc/pam.d/xrdp-sesman
sudo rm /etc/xrdp/* -r

makepkg -s
#sudo pacman -U xrdp-0.9.23.1-1-x86_64.pkg.tar.zst
sudo pacman -U `find *.tar.zst`

# Enable the systemd service
sudo systemctl enable xrdp
sudo systemctl start xrdp

sudo steamos-readonly enable
echo "Script done."
