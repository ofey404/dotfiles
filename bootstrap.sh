#!/bin/bash
# Collection of some commands,
#   which install my handy tools.
# Assume to run on fedora 33, with sudo privilege.

sudo dnf install -y python3-pip fzf neovim git fortune-mod make npm

cd /opt/
sudo git clone https://github.com/magicmonty/bash-git-prompt.git

sudo git clone --recursive https://github.com/akinomyoga/ble.sh.git
sudo make -C ble.sh install PREFIX=/home/ofey/.local

# Vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cd /home/ofey/Code

git clone https://github.com/ofey404/dotfiles.git

cd dotfiles
ln -srf init.vim ~/.config/nvim/init.vim
ln -srf bashrc ~/.bashrc
