# install git neovim zsh tmux autojump stow by package manager

if [ -e "$HOME/.zshrc" ] ; then
  printf "Found existing .zshrc in your \$HOME dir, Will create a backup at $HOME/..zshrc.bak\n"
fi

cp -f "$HOME/.zshrc" "$HOME/.zshrc.bak" 2>/dev/null || true

ln -sf ./external/oh-my-zsh "$HOME"/.oh-my-zsh

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install tmux.conf
./tmux-config/install.sh
