# install vim zsh tmux autojump stow by package manager

# install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

mv ~/.zshrc ~/.zshrc.backup
stow vim
stow zsh