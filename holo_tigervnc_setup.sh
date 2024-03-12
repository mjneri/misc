#!/bin/bash

# For setting up TigerVNC Server and xrdp on Steam Deck.
# Run using 'source holo_tigervnc_setup.sh'
# Run this instead of holo_vncserver_xrdp_setup.sh when planning to remote to Steam Deck using Windows RDP
# Make sure to setup pacman keys and GCC first 
# Many thanks to https://www.reddit.com/r/SteamDeck/comments/ul8uvu/install_vnc_server/

# Mandatory:
sudo steamos-readonly disable

# Install TigerVNC - Remove Existing files first
sudo rm /etc/X11/tigervnc/Xsession
sudo pacman -S tigervnc

# Install xorg-xinit
sudo pacman -S xorg-xinit

sudo steamos-readonly enable
echo "Script done."
