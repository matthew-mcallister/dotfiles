PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
alias ls='ls --color=auto -A'
alias ll='ls -l'
alias s='ls'
alias l='ls'
alias sl='ls'
alias grep='grep --color=auto'
[ -f .bash_aliases.local ] && . .bash_aliases.local
