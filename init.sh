# install vim zsh tmux autojump stow by package manager

# install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

if [ -f "$HOME/.zshrc" ] ; then
  mv ~/.zshrc ~/.zshrc.backup
fi

stow vim
stow zsh