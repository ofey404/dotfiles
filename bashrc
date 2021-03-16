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
source /etc/bash_completion.d/fzf
source /opt/gitstatus/gitstatus.prompt.sh

export NOTES_CLI_HOME=/home/ofey/Documents/Notes
export FZF_DEFAULT_COMMAND='rg --files'
export NOTES_CLI_EDITOR=nvim

export EDITOR=nvim
export VISUAL=nvim

export VIRTUALENVWRAPPER_SCRIPT=/home/ofey/.local/bin/virtualenvwrapper.sh

export WORKON_HOME=/home/ofey/.virtualenvs

export USER=ofey
export VIRTUALENVWRAPPER_PROJECT_FILENAME=.project
export PATH="/home/ofey/.go-tpc/bin:/home/ofey/.go-tpc/bin:/home/ofey/.local/bin:/home/ofey/.tiup/bin:/home/ofey/.go-tpc/bin:/home/ofey/.cargo/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/var/lib/snapd/snap/bin"


export VIRTUALENVWRAPPER_HOOK_DIR=/home/ofey/.virtualenvs

export GOPATH=~/go
export GOROOT=/usr/bin/go


alias NetAuth='python ~/misc/NetAuth.py'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias c='code'
alias clipboard='xclip -selection clipboard'
alias egrep='egrep --color=auto'
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

alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'



counter () 
{ 
    for file in "$1"/*;
    do
        if [ -d "$file" ]; then
            echo "$file";
            counter "$file";
        fi;
    done
}
go_playground () 
{ 
    mkdir -p $1_playground;
    cd $1_playground;
    go mod init ofey404/$1_playground;
    nvim main.go
}
notes_new_in_exist_category () 
{ 
    notes new $(counter $NOTES_CLI_HOME | fzf) $1
}
notes_open_category () 
{ 
    notes list | fzf --height 40% --layout=reverse --preview 'cat {} 2> /dev/null | head -500' | xargs -o $NOTES_CLI_EDITOR
}
pet-prev () 
{ 
    PREV=$(echo `history | tail -n2 | head -n1` | sed 's/[0-9]* //');
    sh -c "pet new `printf %q "$PREV"`"
}
pet-select () 
{ 
    BUFFER=$(pet search --query "$READLINE_LINE");
    READLINE_LINE=$BUFFER;
    READLINE_POINT=${#BUFFER}
}
proxy () 
{ 
    export http_proxy='http://127.0.0.1:8118';
    export https_proxy='https://127.0.0.1:8118';
    export HTTP_PROXY='http://127.0.0.1:8118';
    export HTTPS_PROXY='https://127.0.0.1:8118'
}
unproxy () 
{ 
    unset http_proxy;
    unset https_proxy;
    unset HTTP_PROXY;
    unset HTTPS_PROXY
}

bind -x '"\C-x\C-x": pet-select'