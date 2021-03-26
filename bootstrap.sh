#!/bin/bash
# Collection of some commands,
#   which install my handy tools.
# Assume to run on fedora 33, with sudo privilege.

sudo dnf install -y python3-pip fzf neovim git fortune-mod

cd /opt/
sudo git clone https://github.com/magicmonty/bash-git-prompt.git

