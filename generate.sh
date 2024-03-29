#!/usr/bin/env bash
# set -x             # for debug
set -euo pipefail  # fail early
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )" 

VIMRC=$SCRIPT_DIR/vimrc

vimrc(){
    cat <<-EOF > $VIMRC
" ========================================================
" Generated by stripping my original config file.
" No plugin/plugin manager support.
" curl -L -O https://raw.githubusercontent.com/ofey404/dotfiles/master/vimrc
EOF

    sed '/" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^/q' init.vim >> $VIMRC
}

gnome-user.conf(){
    dconf dump / > $SCRIPT_DIR/gnome-user.conf
}

VSCODE_CONFIG_DIR=$HOME/.config/Code/User

vscode(){
    cp -t $SCRIPT_DIR/vscode $VSCODE_CONFIG_DIR/keybindings.json $VSCODE_CONFIG_DIR/settings.json
}

main(){
    vimrc
    vscode
    gnome-user.conf
}

main "$@"
