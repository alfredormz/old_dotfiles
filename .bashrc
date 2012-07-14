export PS1='\[\033[01;32m\]\W \[\033[01;31m\]\[\033[01;33m\]$(echo $(branch_prompt)) \[\033[00;37m\]$\[\033[00m\] '

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

alias grep='grep --color'
alias ls='ls --color'
alias sl='ls'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias less='less -R'
alias du='du -h'
alias df='df -h'
alias free='free -m'
alias c='clear'
alias q='exit'
alias :q='exit'
alias irc='weechat-curses'
alias h='history'
alias v='vim'
alias tmux='TERM=xterm-256color tmux'

alias rb='ruby'
alias irb='irb --simple-prompt --readline'

alias rebash='. ~/.bashrc'
alias vimbash='vim ~/.bashrc'
alias bashrc='${EDITOR} ~/.bashrc; rebash'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gp='git push'
alias gl='git pull'
alias gst="git status"
alias gci="git commit"
alias gco="git checkout"
alias gdiff="git diff"
alias gd="git diff | vim -R -"
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias glog="git log --graph --oneline --all"

alias pjson='python -mjson.tool'

#cd() { builtin cd "$@" && ls -l; }

ips(){
  ifconfig | grep 'inet ' | cut -d':' -f2 | cut -d' ' -f1 | tail -n 1

  inet=$(curl http://icanhazip.com/ 2> /dev/null)

  if [ ! -z $inet ]
  then
    echo $inet
  fi
}

branch(){
  test -d .git && git symbolic-ref HEAD 2> /dev/null | cut -d/ -f3,4
}

parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo " ✗" 
}

branch_prompt(){
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

which_ruby(){
  rvm-prompt v g
}

push() {
  git push origin $(branch)
}

pull() {
  git pull origin $(branch)
}

merge_to() {
  target=$1
  branch_to_merge=$(branch)
  git checkout ${target}
  git merge --no-ff ${branch_to_merge}
}

merge_tod() {
  target=$1
  branch_to_merge=$(branch)
  git checkout ${target}
  git merge --no-ff ${branch_to_merge}
  git branch -d ${branch_to_merge}
}

empty_gh() {
  repository=$1
  github_user=$(git config github.user)
  mkdir "$repository"
  cd "$repository"
  git init
  touch README.md
  git add README.md
  git commit -m 'First commit'
  git remote add origin git@github.com:${github_user}/${repository}.git
}

exists_gh() {
  repository=$1
  cd "$repository"
  github_user=$(git config github.user)
  git remote add origin git@github.com:${github_user}/${repository}.git
}

tnew(){
  session=$1
  tmux new-session -s ${session} -d
}

tatt(){
  session=$1
  tmux attach -t ${session}
}

tls(){
  tmux ls
}

function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR=vim
export JAVA_HOME=/opt/jdk1.7.0_04
export PATH=/usr/local/pgsql/bin:$PATH
export PATH=/opt/mongodb/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PYTHONSTARTUP=$HOME/.pythonrc
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

rvm default
