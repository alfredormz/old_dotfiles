export PS1='\[\033[01;32m\]\W \[\033[01;33m\]$(branch_prompt)\[\033[00;37m\]$\[\033[00m\] '

export HISTSIZE=1000
export HISTFILESIZE=2000
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
alias irc='weechat-curses'
alias h='history'
alias v='vim'
alias gnome-terminal='gnome-terminal --hide-menubar'
alias j='jobs'

alias rb='ruby'
alias irb='irb --simple-prompt --readline'
alias railsc=' pry -r ./config/environment.rb'
alias wrb="ruby -run -e httpd . -p 5000"
alias rvmp="rvm-prompt"
alias rebash='. ~/.bashrc'
alias bashrc='${EDITOR} ~/.bashrc; rebash'

alias tmux='tmux attach || tmux -2'

alias q='exit'
alias :q='exit'
alias :wq='sudo shutdown -r now'

#git
alias git=hub
alias gti=git
alias g=git
alias ga='git add'
alias gb='git branch'
alias gp='git push'
alias gl='git pull'
alias gs="git status --short"
alias gd="git diff"
alias gci="git commit"
alias gco="git checkout"
alias gf='git fetch'
alias gl='git l'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias glog="git log --graph --oneline --all"

alias pjson='python -mjson.tool'

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

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
  status=$(git status 2> /dev/null | tail -n1)
  if [[ $status == "" ]]
  then
    echo " "
  else
    if [[ $status != "nothing to commit, working directory clean" ]]
    then
      echo " ✗ "
    fi
  fi
}

branch_prompt(){
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

which_ruby(){
  rvm-prompt g
}

git_prompt_info() {
   ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
   echo "${ref#refs/heads/}"
}

push() {
  git push origin $(branch)
}

pull() {
  git pull origin $(branch)
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

if [ -f ~/Dropbox/zsh_aliases ]; then
    . ~/Dropbox/zsh_aliases
fi

export EDITOR=vim
export JAVA_HOME=/opt/jdk1.7.0_04
export PATH=/usr/local/pgsql/bin:$PATH
export PATH=/opt/mongodb/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PYTHONSTARTUP=$HOME/.pythonrc

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

rvm default

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

