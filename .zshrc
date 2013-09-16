# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

if [ -f ~/Dropbox/zsh_aliases ]; then
  source ~/Dropbox/zsh_aliases
fi

#export TERM=xterm-256color
export EDITOR=vim
export PATH=/opt/phantom/bin:/usr/local/pgsql/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
