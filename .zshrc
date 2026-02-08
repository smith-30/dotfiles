### Paths / env ###############################################################
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

### Completion ################################################################
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

fpath=(/usr/local/share/zsh-completions $fpath)

# git-completionの読み込み
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash

autoload -Uz compinit
compinit

### Git prompt ################################################################
# git-promptの読み込み
[ -r ~/.git-prompt.sh ] && source ~/.git-prompt.sh

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

### Prompt ####################################################################
setopt PROMPT_SUBST
PS1='%F{cyan}%~%f %F{green}$(__git_ps1 "(%s) ")%f\$ '

### Docker ####################################################################
alias dp='docker ps'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias dcbn='docker compose build --no-cache'
alias di='docker images'
alias dpp='docker ps --format="table {{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'

de() {
  docker exec -it "$1" bash
}

### Git #######################################################################
alias gl='git log --graph'
alias gs='git status'

# \#26などとして渡すこと。でないとコメントアウト扱いになる
gce() {
  git commit --allow-empty -m "resolve $1"
}

# push current branch to remote
gpush() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return 1
  if [[ "$branch" == "HEAD" ]]; then
    echo "gpush: detached HEAD" >&2
    return 1
  fi
  git push origin "$branch"
}

# pull current branch from remote
gpull() {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return 1
  if [[ "$branch" == "HEAD" ]]; then
    echo "gpull: detached HEAD" >&2
    return 1
  fi
  git pull origin "$branch"
}

### Tools #####################################################################
# enhancd
[ -r ~/enhancd/init.sh ] && source ~/enhancd/init.sh
export ENHANCD_FILTER=sk
eval "$(zoxide init zsh)"

### History ###################################################################
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# share .zsh-history
setopt inc_append_history
setopt share_history
export HISTCONTROL=ignoreboth # ignoredupsとignorespaceどちらも設定する
export HISTIGNORE=history     # historyは記録しない。

### Keybindings / Widgets #####################################################
# fzf history
fzf-select-history() {
  BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

fkill() {
  local pid
  pid=$(
    ps -u "$USER" -o pid,%cpu,%mem,etime,command | sed 1d |
      fzf --multi --height=50% --border \
        --prompt='kill> ' \
        --header='PID  CPU MEM  TIME   COMMAND' \
        --preview 'ps -p {1} -o pid,ppid,%cpu,%mem,etime,command' |
      awk '{print $1}'
  )

  [[ -n "$pid" ]] && kill "$pid"
}

# Ctrl + k でプロセス Kill
zle -N fkill-widget
fkill-widget() {
  fkill
  zle reset-prompt
}
bindkey '^K' fkill-widget

### Options ###################################################################
setopt rm_star_wait  # rm * の前に確認
setopt extended_glob # 高機能glob有効化
