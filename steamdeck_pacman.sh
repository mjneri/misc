#!/bin/bash

# For easily installing packages on Steam Deck using pacman.
# Commands were taken from https://steamdecki.org/SteamOS/Read-only_Filesystem

sudo steamos-readonly disable
sudo pacman-key --init
#sudo pacman-key --populate archlinux

# From comment by "cmhacks" in https://www.reddit.com/r/SteamOS/comments/180kg3c/after_the_355_update_everytime_i_try_to_install/
# Running the command below seems to populate holo keys as well (not really sure what that means...)
sudo pacman-key --populate

# Do an apt-get update
sudo pacman -Syy

echo "Script done."
