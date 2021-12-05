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


if [[ -z "$IN_VSCODE_INTEGRATED_TERMINAL" ]]; then
    export EDITOR=nvim
    export VISUAL=nvim
else
    export EDITOR=code
    export VISUAL=code
fi


[[ -f /usr/share/fzf/shell/key-bindings.bash ]] && source /usr/share/fzf/shell/key-bindings.bash [[ -f /etc/bash_completion.d/fzf ]] && source /etc/bash_completion.d/fzf
[[ $- == *i* ]] && source /opt/bash-git-prompt/gitprompt.sh
[[ -f /.secret/secretrc ]] && source ~/.secret/secretrc
[[ -f /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
[[ -s "/home/ofey/.gvm/scripts/gvm" ]] && source "/home/ofey/.gvm/scripts/gvm"


export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export VIRTUALENVWRAPPER_SCRIPT=/home/ofey/.local/bin/virtualenvwrapper.sh
export WORKON_HOME=/home/ofey/.virtualenvs
export VIRTUALENVWRAPPER_PROJECT_FILENAME=.project
export PATH="/home/ofey/.go-tpc/bin:/home/ofey/.go-tpc/bin:/home/ofey/.local/bin:/home/ofey/.tiup/bin:/home/ofey/.go-tpc/bin:/home/ofey/.cargo/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/var/lib/snapd/snap/bin"
export PATH="$PATH:/home/ofey/go/bin"
export PATH="/usr/local/cuda-11.3/bin:$PATH"
export FZF_COMPLETION_TRIGGER=','
export VIRTUALENVWRAPPER_HOOK_DIR=/home/ofey/.virtualenvs
export PATH=$PATH:/usr/local/go/bin
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
export PAGER="nvimpager"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export SYSTEM_CLIPBOARD_COMMAND='xclip -selection clipboard'


unset GOROOT


alias a="$PAGER"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias c="$SYSTEM_CLIPBOARD_COMMAND"
alias e="$EDITOR"
alias f='fuck'
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1)) && eval $TF_CMD; history -s $TF_CMD'
alias g='google.sh'
alias info='info --vi-key'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias m='make'
alias man='PAGER=less moreman'
alias note='typora ~/Documents/Note.md'
alias p='proxychains'
alias pafd='cd ~/Code/pafd-automated/ ; python main.py'
alias sl='ls'
alias t='firefox --new-tab'
alias typora="typora-nohup"
alias which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
alias x='xdg-open'
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

for COLOR_AUTO in ls grep egrep fgrep xzegrep xzfgrep xzgrep zegrep zfgrep zgrep
do
    alias $COLOR_AUTO="$COLOR_AUTO --color=auto"
done


pet-prev () 
{ 
    local PREV=$(echo `history | tail -n2 | head -n1` | sed 's/[0-9]* //');
    sh -c "pet new `printf %q "$PREV"`"
}
pet-select () 
{ 
    local BUFFER=$(pet search --query "$READLINE_LINE");
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
leave-ranger-with-cd ()
{
    if ranger --choosedir=$HOME/.rangerdir
    then
        local RANGER_DIR=$(cat $HOME/.rangerdir)
        if [[ ! "$RANGER_DIR" -ef . ]]
        then
            local RANGER_RELATIVE_DIR=$(realpath --relative-base=. $RANGER_DIR)
            READLINE_LINE="cd $RANGER_RELATIVE_DIR"
            READLINE_POINT=${#READLINE_LINE}
        fi
    fi
}
fzf-cd-with-linebreak(){
    READLINE_LINE=$READLINE_LINE$(__fzf_cd__)
    READLINE_POINT=${#READLINE_LINE}
}
# Open a typora that won't exit while terminal closes
typora-nohup(){
    \typora $@ &
    disown $!
}


stty stop undef
bind -x '"\C-s": pet-select'
stty kill undef
bind -x '"\C-u": kill-to-system'
bind -x '"\C-g": gitui'
bind -x '"\C-h": leave-ranger-with-cd'
stty discard undef
bind -x '"\C-o": fzf-cd-with-linebreak'

shopt -s histappend                      # append to history, don't overwrite it

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Bash Line Editor and fortune
#   Those lines should be at the end of the config file.
[[ $- == *i* ]] && fortune



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

