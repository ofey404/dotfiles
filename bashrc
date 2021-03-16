# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

source /usr/share/fzf/shell/key-bindings.bash

NOTES_CLI_HOME=/home/ofey/Documents/Notes
NOTES_CLI_EDITOR=nvim

EDITOR=nvim
VISUAL=nvim


VIRTUALENVWRAPPER_SCRIPT=/home/ofey/.local/bin/virtualenvwrapper.sh

WORKON_HOME=/home/ofey/.virtualenvs

USER=ofey
VIRTUALENVWRAPPER_PROJECT_FILENAME=.project
PATH="/home/ofey/.go-tpc/bin:/home/ofey/.go-tpc/bin:/home/ofey/.local/bin:/home/ofey/.tiup/bin:/home/ofey/.go-tpc/bin:/home/ofey/.cargo/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/var/lib/snapd/snap/bin"


VIRTUALENVWRAPPER_HOOK_DIR=/home/ofey/.virtualenvs

GOPATH=/home/ofey/go

alias NetAuth='python ~/misc/NetAuth.py'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias builtin='_gitstatus_builtin_wrapper'
alias c='code'
alias cdc='cd ~/Code'
alias cdd='cd ~/Desktop'
alias clipboard='xclip -selection clipboard'
alias egrep='egrep --color=auto'
alias exec='_gitstatus_exec_wrapper'
alias f='firefox --new-tab'
alias fgrep='fgrep --color=auto'
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1)) && eval $TF_CMD; history -s $TF_CMD'
alias g='google.sh'
alias grep='grep --color=auto'
alias k='kubectl'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias mingw32-env='eval `rpm --eval %{mingw32_env}`'
alias ne='notes_open_category'
alias nn='notes_new_in_exist_category'
alias nr='notes list --sort modified | fzf | xargs -o nvim '
alias ns='notes save'
alias pafd='cd ~/Code/pafd-automated/ ; python main.py'
alias remote='xfreerdp +window-drag +clipboard /u:Administrator /p:Co299792458 /v:106.15.249.201 /dynamic-resolution 2>&1 >> ~/misc/log/remote.log'
alias ta='todo add'
alias tl='todo list'
alias tr='todo remove'
alias typora='/opt/typora/Typora'
alias vim='nvim'
alias which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
alias wiki='tiddlywiki ~/Documents/MyWiki/ --listen'

alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
