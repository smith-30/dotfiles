# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
nodebrew use v6.2.0

# git support (git-completion, git-prompt)
source ~/.git-completion.bash
export PS1='\[\e[1;34m\]▶︎ \[\e[00m\][ @ \w\[\e[1;32m\]\[$(__git_ps1 " (%s)")\[\e[00m\]] $ '
source ~/.git-prompt.sh

# some more ls aliases
alias ll='ls -alF'

#---------- docker alias
alias dp='docker ps'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcbn='docker-compose build --no-cache'
alias di='docker images'

function de() {
    docker exec -it $1 bash
}
#---------- docker alias¬


# Git---------- git alias

alias gl='git log --graph'
alias gs='git status'

# \#26などとして渡すこと。でないとコメントアウト扱いになる
function gce() {
    git commit --allow-empty -m "resolve $1"
}

# push current branch to remote
alias gpush='git branch --contains=HEAD | sed 's/*//' | xargs -n 1 -p git push origin'

# pull current branch from remote
alias gpull='git branch --contains=HEAD | sed 's/*//' | xargs -n 1 -p git pull origin'

#Git ---------- git alias

# AWS
function bucket_dl() {
    aws s3 cp --region ap-northeast-1 "s3://$1/" . --recursive
}

#Util
function searchText() {
    find ./ -type f -print | xargs grep "$1"
}

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

# phpenv
export PATH="/Users/xxx/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
export PATH="/usr/local/opt/bison@2.7/bin:$PATH"

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"
source ~/.enhancd/init.sh

