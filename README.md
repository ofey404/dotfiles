# Manage Linux Configuration Files Properly

## install

install vim zsh tmux autojump stow by package manager

xsel if want to commuincate tmux clipboard with host

```shell
sudo apt-get install vim zsh tmux autojump stow
```

then execute:

```shell
git clone --recursive https://github.com/ofey404/dotfiles.git .dotfiles
cd .dotfiles
./init.sh  # for default installation, init.sh could only run in directory .dotfiles
```

### about clipboard

[this plugin](https://github.com/wincent/clipper) might be useful. If i have time to play with.

### Keyboard modification

add in /etc/default/keyboard:

```shell
XKBOPTIONS="ctrl:nocaps"
```

## requirements

in apt repo: zsh, tmux, vim, autojump

not in: oh-my-zsh

Special notes below to indicate something which couldn't be installed by apt-get.

### install oh-my-zsh

```shell
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

## use a exist tmux conf

[conf link](https://github.com/samoshkin/tmux-config#copy-mode.com/samoshkin/tmux-config#copy-mode)

this bro has made a great hack. This is his article: [tmux in pracitce](https://medium.freecodecamp.org/tmux-in-practice-series-of-posts-ae34f16cfab0)

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
```

## references

about how to manage dotfiles with GNU stow [Using GNU Stow to manage your dotfiles(Chinese translation)](https://farseerfc.me/zhs/using-gnu-stow-to-manage-your-dotfiles.html)
