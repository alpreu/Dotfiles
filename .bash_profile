# stop homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1

# use jenv to manage java versions
eval "$(jenv init -)"

# load rvm into shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# opinionated defaults
alias ..="cd .."
alias cp="cp -ai"
alias mv="mv -i"
alias ls="ls -G"
alias grep="grep --color=always"

mkcd () {
    mkdir "$1" &&
    cd "$1"
}

# faster access to some programs
alias py="python3"
alias firefox="open -a firefox"
alias 'class-dump'="/Applications/class-dump"

# useful information
alias week="date +%V"
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

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1 # indicate local changes

PS1='$TIMELINE \t
\[\033[1;32m\]\u \[\033[0;37m\]at \[\033[1;38;5;45m\]\h \[\033[0;37m\]in \[\033[1;31m\]\w \[\033[33m\]$(__git_ps1 "(%s)")
\[\033[37m\]😎  \[\033[m\]'
