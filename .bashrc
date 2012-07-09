export PS1='\[\033[01;32m\]\W \[\033[01;33m\]$(echo $(branch)) \[\033[00;37m\]$\[\033[00m\] '

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

alias grep='grep --color'
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias less='less -R'
alias du='du -h'
alias df='df -h'
alias free='free -m'
alias irb='irb --simple-prompt --readline'
alias rebash='. ~/.bashrc'
alias vimbash='vim ~/.bashrc'
alias bashrc='${EDITOR} ~/.bashrc; rebash'
alias gst="git status -sb"
alias gci="git commit"
alias gco="git checkout"
alias gdiff="git diff"
alias glog="git log --graph --oneline --all"

alias pjson='python -mjson.tool'

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

which_ruby(){
  rvm-prompt v g
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
