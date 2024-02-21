
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

# peco --------
## history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

## share .zshhistory
setopt inc_append_history
setopt share_history

function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr

function peco-ghq-look () {
    local ghq_roots="$(git config --path --get-all ghq.root)"
    local selected_dir=$(ghq list --full-path | \
        xargs -I{} ls -dl --time-style=+%s {}/.git | sed 's/.*\([0-9]\{10\}\)/\1/' | sort -nr | \
        sed "s,.*\(${ghq_roots/$'\n'/\|}\)/,," | \
        sed 's/\/.git//' | \
        peco --prompt="cd-ghq >" --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq list --full-path | grep --color=never -E "/$selected_dir$")"
        zle accept-line
    fi
}

zle -N peco-ghq-look
bindkey '^G' peco-ghq-look

# !peco --------

# enhancd
source ~/enhancd/init.sh
