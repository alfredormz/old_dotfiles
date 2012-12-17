# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

autoload -U compinit
compinit

cdpath=(~ ~/dev/overol)

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

#export TERM=xterm-256color
export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
