# stop homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1

# default to english output
export LANG=en_US.utf-8

# use jenv to manage java versions
eval "$(jenv init -)"

# load rvm into shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# virtualenv for python stuff
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# opinionated defaults
alias ..="cd .."
alias cp="cp -ai"
alias mv="mv -i"
alias ls="ls -G"
alias l="ls -al"
alias grep="grep --color=always"
alias pass="pass -c"


mkcd () {
    mkdir "$1" &&
    cd "$1"
}

# faster access to some programs
alias py="python3"
alias firefox="open -a firefox"
alias 'class-dump'="/Applications/class-dump"
alias tldr="tldr find"
alias mongod="mongod --config /usr/local/etc/mongod.conf"

alias battery="pmset -g batt"

# fancy prompt
function prompt_command {
    TIMELINE=""
    let fillsize=${COLUMNS}-10 # leave space for timestamp
    while [ "$fillsize" -gt "0" ]
    do
        TIMELINE="-${TIMELINE}" # fill with underscores to work on
        let fillsize=${fillsize}-1
    done
}
PROMPT_COMMAND=prompt_command

source ~/.dotfiles/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1 # indicate local changes

PS1='$TIMELINE \t
\[\033[1;32m\]\u \[\033[0;37m\]at \[\033[1;38;5;45m\]\h \[\033[0;37m\]in \[\033[1;31m\]\w \[\033[33m\]$(__git_ps1 "(%s)")
\[\033[37m\]😎  \[\033[m\]'

#source /usr/local/etc/bash_completion.d/pass
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

