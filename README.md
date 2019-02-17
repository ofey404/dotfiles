# Manage Linux Configuration Files Properly

## installation guide

### requirements:

in apt repo: zsh, tmux, vim, autojump

not in: oh-my-zsh

Special notes below to indicate something which couldn't be installed by apt-get.

### install oh-my-zsh

```shell
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

## stow - manage link

want to make link for configuration files in dotfiles/git:

```shell
stow -d $HOME/.dotfiles -t $home git
```

## modify caps to ctrl

(used on a physical machine)add in /etc/default/keyboard

```bash
XKBOPTIONS="ctrl:nocaps"
