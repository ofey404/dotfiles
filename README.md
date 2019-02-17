# Manage Linux Configuration Files Properly

## stow - manage link

dotfiles/git

stow -d $HOME/.dotfiles -t $home git

## modify caps to ctrl

add in /etc/default/keyboard

```bash
XKBOPTIONS="ctrl:nocaps"
