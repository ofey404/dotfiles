# Manage Linux Configuration Files Properly

## install

install vim zsh tmux autojump stow by package manager

```shell
git clone --recursive git@github.com:ofey404/dotfiles.git .dotfiles
~/.dotfiles/init.sh  # for default installation
```

## requirements:

in apt repo: zsh, tmux, vim, autojump

not in: oh-my-zsh

Special notes below to indicate something which couldn't be installed by apt-get.

### install oh-my-zsh

```shell
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

## use a exist tmux conf

https://githubhttps://github.com/samoshkin/tmux-config#copy-mode.com/samoshkin/tmux-config#copy-mode

this bro has made a great hack.

learn how to add the project as a submodule, and add this as a submodule of my dot file

## stow - manage link

want to make link for configuration files in dotfiles/git:

```shell
stow -d $HOME/.dotfiles -t $home git
```

## modify caps to ctrl

(used on a physical machine)add in /etc/default/keyboard

```bash
XKBOPTIONS="ctrl:nocaps"
