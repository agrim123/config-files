###########
# Aliases #
###########

alias _="sudo"
alias refresh="echo 'Refreshing .zshrc\n' && source ~/.zshrc"
alias docker-start="open --background -a Docker"
alias edit="vim ~/.zshrc"
alias restart-ssh="sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist && sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist"
alias code="/usr/local/bin/code"

alias mexec="chmod +x "

#######
# Git #
#######
alias gcp="git cherry-pick"
alias gpom="git push origin master"
alias gpos="git push origin staging"
alias reset-staging="git stash && gco master && git pull --rebase origin master && gb -D staging; gco -b staging && git push origin staging -f"
alias push-staging="gb -D staging; gco -b staging && git push origin staging -f"
alias update-master="gco master && git pull --rebase origin master && gb"

# Useful when testing golang pkgs
alias last-commit="git rev-parse HEAD | cut -c1-12"

source $HOME/dotfiles/custom/alias.zsh
