#!/bin/bash
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

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    export GIT_PROMPT_THEME=Single_line_NoExitState
else
    export GIT_PROMPT_THEME=Solarized_NoExitState
fi

[[ -f /usr/share/fzf/shell/key-bindings.bash ]] && source /usr/share/fzf/shell/key-bindings.bash [[ -f /etc/bash_completion.d/fzf ]] && source /etc/bash_completion.d/fzf
[[ $- == *i* ]] && source /opt/bash-git-prompt/gitprompt.sh
[[ $- == *i* ]] && source /home/ofey/.local/share/blesh/ble.sh --noattach
# [[ -f /opt/ble-0.3.3/ble.sh  ]] && source /opt/ble-0.3.3/ble.sh
[[ -f /.secret/secretrc ]] && source ~/.secret/secretrc
[[ -f /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

export NOTES_CLI_HOME=/home/ofey/Documents/Notes
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NOTES_CLI_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim
export VIRTUALENVWRAPPER_SCRIPT=/home/ofey/.local/bin/virtualenvwrapper.sh
export WORKON_HOME=/home/ofey/.virtualenvs
export USER=ofey
export VIRTUALENVWRAPPER_PROJECT_FILENAME=.project
export PATH="/home/ofey/.go-tpc/bin:/home/ofey/.go-tpc/bin:/home/ofey/.local/bin:/home/ofey/.tiup/bin:/home/ofey/.go-tpc/bin:/home/ofey/.cargo/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/var/lib/snapd/snap/bin"
export PATH="$PATH:/home/ofey/go/bin"
export FZF_COMPLETION_TRIGGER=','
export VIRTUALENVWRAPPER_HOOK_DIR=/home/ofey/.virtualenvs
export PATH=$PATH:/usr/local/go/bin
export FZF_COMPLETION_TRIGGER=','
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export PAGER="nvimpager"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"

unset GOROOT

alias NetAuth='python ~/misc/NetAuth.py'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias c='xclip -selection clipboard'
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
alias ne='notes-open-category'
alias nn='notes-new-in-exist-category'
alias nr='notes-open-recent'
alias ns='notes save'
alias pafd='cd ~/Code/pafd-automated/ ; python main.py'
alias remote='xfreerdp +window-drag +clipboard /u:Administrator /p:Co299792458 /v:106.15.249.201 /dynamic-resolution 2>&1 >> ~/misc/log/remote.log'
alias ta='todo add'
alias tl='todo list'
alias tr='todo remove'
alias typora='/opt/typora/Typora'
alias which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias p='proxychains'
alias lastcmd='history | tail -n 2 | head -n 1 | sed "s/ *[0-9]* //"'
alias t='firefox --new-tab'
alias man='moreman'
alias s='source .env'
alias info='info --vi-key'
alias x='xdg-open'


SYSTEM_CLIPBOARD_COMMAND='xclip -selection clipboard'

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
notes-new-in-exist-category () 
{ 
    notes new $(counter $NOTES_CLI_HOME | fzf) $1
}
notes-open-category () 
{ 
    notes list | fzf --height 40% --layout=reverse --preview 'cat {} 2> /dev/null | head -500' | xargs -o $NOTES_CLI_EDITOR
}
notes-open-recent () {
    if f=$(notes list --sort modified | fzf)
    then
        $EDITOR $f
    fi
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
kill-to-system ()
{
    echo "$READLINE_LINE" | $SYSTEM_CLIPBOARD_COMMAND
    READLINE_LINE=""
}
open-in-nvim () 
{ 
    if [[ -z "$READLINE_LINE" ]]
    then
        if f=$(fzf)
        then
            READLINE_LINE="nvim $f"
        fi
    else
        READLINE_LINE="nvim $READLINE_LINE"
    fi
    READLINE_POINT=${#BUFFER}
}
leave-ranger-with-cd ()
{
    if ranger --choosedir=$HOME/.rangerdir
    then
        RANGER_DIR=$(cat $HOME/.rangerdir)
        if [[ ! "$RANGER_DIR" -ef . ]]
        then
            RANGER_RELATIVE_DIR=$(realpath --relative-base=. $RANGER_DIR)
            READLINE_LINE="cd $RANGER_RELATIVE_DIR"
            READLINE_POINT=${#BUFFER}
        fi
    fi
}


stty stop undef
bind -x '"\C-s": pet-select'
stty kill undef
bind -x '"\C-u": kill-to-system'
bind -x '"\C-g": gitui'
bind -x '"\C-h": leave-ranger-with-cd'
bind -x '"\C-v": open-in-nvim'


shopt -s histappend                      # append to history, don't overwrite it

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Those lines should be at the end of the config file.
[[ $- == *i* ]] && fortune
[[ ${BLE_VERSION-} ]] && ble-attach

