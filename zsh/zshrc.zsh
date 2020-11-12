#zmodload zsh/zprof
export ZSH="/path/.oh-my-zsh"

ZSH_THEME="common"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source ~/zsh/env.zsh
source ~/zsh/options.zsh
source ~/zsh/alias.zsh
source ~/zsh/bindings.zsh
source ~/zsh/functions.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

#zprof
#zmodload -u zsh/zprof
