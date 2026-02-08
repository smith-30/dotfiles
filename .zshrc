# 補完機能を有効にする
autoload -Uz compinit
compinit

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

fpath=(/usr/local/share/zsh-completions $fpath)

# git-promptの読み込み
source ~/.git-prompt.sh

# git-completionの読み込み
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

#
# prompt
#
setopt PROMPT_SUBST;
PS1='%F{cyan}%~%f %F{green}$(__git_ps1 "(%s) ")%f\$ '

#---------- docker alias
alias dp='docker ps'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcbn='docker-compose build --no-cache'
alias di='docker images'
alias dpp='docker ps --format="table {{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'

function de() {
    docker exec -it $1 bash
}
#---------- docker alias

# Git---------- git alias

alias gl='git log --graph'
alias gs='git status'

# \#26などとして渡すこと。でないとコメントアウト扱いになる
function gce() {
    git commit --allow-empty -m "resolve $1"
}

# push current branch to remote
alias gpush='git branch --contains=HEAD | sed "s/*//" | xargs -n 1 -p git push origin'

# pull current branch from remote
alias gpull='git branch --contains=HEAD | sed "s/*//" | xargs -n 1 -p git pull origin'

#Git ---------- git alias

# enhancd
source ~/enhancd/init.sh
export ENHANCD_FILTER=sk
eval "$(zoxide init zsh)"

## history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## share .zsh-history
setopt inc_append_history
setopt share_history
export HISTCONTROL=ignoreboth    # ignoredupsとignorespaceどちらも設定する
export HISTIGNORE=history     # historyは記録しない。

# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history