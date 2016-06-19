#
# ~/.bashrc
#

muttChangeFolder(){
    if [ -z "$1" ]
    then mutt
    else
        mutt -f +$1/INBOX
    fi
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh
source /home/manuel/.doComplete.bash
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
ls='ls --color=auto'
