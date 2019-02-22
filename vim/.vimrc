imap jk <Esc>
imap kj <Esc>

set nu
set autoindent
set mouse=a
syntax on
set timeoutlen=1000 ttimeoutlen=0

"##### plugins  ###########

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"##### auto fcitx  ###########
"# let g:input_toggle = 0
"# function! Fcitx2en()
"#    let s:input_status = system("fcitx-remote")
"#    if s:input_status == 2
"#       let g:input_toggle = 1
"#       let l:a = system("fcitx-remote -c")
"#    endif
"# endfunction
"# 
"# function! Fcitx2zh()
"#    let s:input_status = system("fcitx-remote")
"#    if s:input_status != 2 && g:input_toggle == 1
"#       let l:a = system("fcitx-remote -o")
"#       let g:input_toggle = 0
"#    endif
"# endfunction
"# 
"# set ttimeoutlen=150
"# "退出插入模式
"# autocmd InsertLeave * call Fcitx2en()
"# "进入插入模式
"# autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######
