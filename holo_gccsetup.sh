#!/bin/bash

# For setting up GCC on Steam Deck after a SteamOS update.
# Main reference: https://www.reddit.com/r/SteamDeck/comments/ulalfn/comment/jmwd2g5/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
# Make sure to setup the pacman keys first - see steamdeck_pacman.sh

sudo steamos-readonly disable
sudo pacman -S gcc base-devel glibc linux-api-headers --noconfirm
sudo steamos-readonly enable

echo "Script done."
