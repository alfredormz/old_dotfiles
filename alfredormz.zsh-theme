battery() {
  acpi -b | cut -d, -f2 | cut -d% -f1
}


local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%.%{$reset_color%}'
local rvm=''
if which rvm-prompt &> /dev/null; then
  rvm='%{$fg[green]%}‹$(rvm-prompt v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm='%{$fg[green]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local battery_info=''
local battery_color="%{$fg[green]%}"

if [ "$(battery)" -lt "30" ]
then
  battery_color="%{$fg[yellow]%}"
fi
if [ "$(battery)" -lt "15" ]
then
  battery_color="%{$fg[red]%}"
fi

if [ "$(battery)" -lt "100" ]
then
  battery_info="${battery_color}[$(battery)%%]%{$reset_color%}"
fi

local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="${pwd} $ "
RPROMPT="${return_code} ${git_branch} ${rvm} ${battery_info}"
