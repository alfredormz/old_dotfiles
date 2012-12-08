# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alfredormz"

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

#export TERM=xterm-256color
export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
