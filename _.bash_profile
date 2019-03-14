export PATH=/usr/local:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/Users/smith-30/go/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

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
#---------- docker alias

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

# peco --------
export HISTCONTROL="ignoredups"
peco-history() {
  local NUM=$(history | wc -l)
  local FIRST=$((-1*(NUM-1)))

  if [ $FIRST -eq 0 ] ; then
    history -d $((HISTCMD-1))
    echo "No history" >&2
    return
  fi
  local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)
  if [ -n "$CMD" ] ; then
    history -s $CMD
    if type osascript > /dev/null 2>&1 ; then
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi

    # Uncomment below to execute it here directly
    echo $CMD >&2
    eval $CMD
  else
    history -d $((HISTCMD-1))
  fi
}
bind -x '"\C-h": peco-history'

peco-kill(){
  local PROC=`ps aux | peco`
  local PID=`echo "$PROC" | awk '{print $2}'`
  if [ -n "$PID" ];then
    echo "kill pid:$PID. [$PROC]"
    kill $PID
  fi
}
bind -x '"\C-k":peco-kill'

function peco-cd {
    cd $(ghq list -p | peco)
}
alias sd='peco-cd'

# !peco --------

# enhancd
source /path/to/enhancd/init.sh

# alias
alias reload_ssh='eval `ssh-agent` && ssh-add ~/.ssh/id_rsa'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# rust
export PATH="$HOME/.cargo/bin:$PATH"
