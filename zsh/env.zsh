# Beautify man pages
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

export LC_ALL=en_US.UTF-8

export GOPATH=$HOME/projects
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
#export PATH="/Users/agrim/Downloads/apache-maven-3.6.0/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export GPG_TTY=$(tty)
export PATH=$PATH:$M2_HOME/bin

#export NVM_DIR="$HOME/.nvm"
    #[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

[ -s "/Users/agrim/.scm_breeze/scm_breeze.sh" ] && source "/Users/agrim/.scm_breeze/scm_breeze.sh"

typeset -U PATH
