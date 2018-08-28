ZSH_THEME_GIT_PROMPT_UNTRACKED='?'
ZSH_THEME_GIT_PROMPT_ADDED='+'
ZSH_THEME_GIT_PROMPT_MODIFIED='!'
ZSH_THEME_GIT_PROMPT_RENAMED='»'
ZSH_THEME_GIT_PROMPT_DELETED='✘'
ZSH_THEME_GIT_PROMPT_STASHED='$'
ZSH_THEME_GIT_PROMPT_UNMERGED='='
ZSH_THEME_GIT_PROMPT_AHEAD='⇡'
ZSH_THEME_GIT_PROMPT_BEHIND='⇣'
ZSH_THEME_GIT_PROMPT_DIVERGED='⇕'

exists() {
  command -v $1 > /dev/null 2>&1
}

prompt_time() {
  bg="%K{default}"
  fg="%F{white}"
  echo -n "%{$bg%}%{$fg%}%D{%H:%M} → "
}

prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && echo -n "$symbols"
}

prompt_battery() {
  HEART='♥'
  bl=$(pmset -g ps | sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p')
  b=${bl//[!0-9]/}
  bg=green
  if [[ $b -gt 40 ]] ; then
    bg=green
    fg=black
  elif [[ $b -gt 20 ]] ; then
    bg=yellow
    fg=black
  else
    bg=red
    fg=white
  fi
  if [[ $(pmset -g ps) == *"AC"* ]] ; then 
    HEART='⌁'
    bg=cyan
    fg=black
  fi
  if [[ $b -gt 99 ]] ; then 
    bl='100 '
  fi
  fg="%F{$fg}"
  fg2="%F{$bg}"
  bg="%K{$bg}"
  def_bg="%K{default}"
  def_fg="%F{default}"
  echo -n "%{$bg%}%{$fg%} $HEART$bl% "
  echo -n "%{$def_bg%}%{$fg2%}"
  echo -n "%{$def_bg%}%{%F{green}%} $  %{$def_fg%}"
}

prompt_pwd() {
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  fg="%F{blue}"
  echo -n "%{$fg%}$prompt_short_dir"
}

prompt_git() {
  STATUS=$(git_prompt_status)
  fg="%F{magenta}"
  if [[ -z $STATUS ]]; then 
    fg="%F{green}"
    STATUS="✔︎"
  fi
  BRANCH=$(git_current_branch)
  if [[ -z $BRANCH ]] ; then 
    echo ''
  else 
    echo -n "%{%F{cyan}%}$BRANCH %{$fg%}$STATUS"
  fi
}

build_prompt() {
  echo -n "\n"
  RETVAL=$?
  prompt_status
  prompt_time
  prompt_pwd
}

build_r_prompt() {
    prompt_git
}

function get_space {
    local str=$1$2
    local zero='%([BSUbfksu]|([FB]|){*})'
    local len=${#${(S%%)str//$~zero/}}
    local size=$(( $COLUMNS - $len - 1 ))
    local space=""
    while [[ $size -gt 0 ]]; do
        space="$space "
        let size=$size-1
    done
    echo $space
}

function print_prompt_head {
    local left_prompt="%{%f%b%k%}$(build_prompt) "
    local right_prompt="%{%f%b%k%}$(build_r_prompt)"
    print -rP "$left_prompt $(get_space $left_prompt $right_prompt) $right_prompt"
}

PROMPT='$(prompt_battery)'

autoload -U add-zsh-hook
add-zsh-hook precmd print_prompt_head
setopt prompt_subst
