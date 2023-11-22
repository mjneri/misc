#!/bin/bash

# For easily installing packages on Steam Deck using pacman.
# Commands were taken from https://steamdecki.org/SteamOS/Read-only_Filesystem

sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux

# Do an apt-get update
sudo pacman -Syy

echo "Script done."
