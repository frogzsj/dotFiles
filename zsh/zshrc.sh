#  /$$$$$$$$  /$$$$$$  /$$   /$$ /$$$$$$$   /$$$$$$
# |_____ $$  /$$__  $$| $$  | $$| $$__  $$ /$$__  $$
#      /$$/ | $$  \__/| $$  | $$| $$  \ $$| $$  \__/
#     /$$/  |  $$$$$$ | $$$$$$$$| $$$$$$$/| $$
#    /$$/    \____  $$| $$__  $$| $$__  $$| $$
#   /$$/     /$$  \ $$| $$  | $$| $$  \ $$| $$    $$
#  /$$$$$$$$|  $$$$$$/| $$  | $$| $$  | $$|  $$$$$$/
# |________/ \______/ |__/  |__/|__/  |__/ \______/

# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotFiles/zsh/plugins/oh-my-zsh

if ls $ZSH/custom/themes/mine* 1> /dev/null 2>&1; then
    # echo "files do exist"
else
    sudo cp $HOME/dotFiles/zsh/mine.zsh-theme $ZSH/custom/themes
fi
ZSH_THEME=mine
plugins=(git vscode sublime)
for plugin ($plugins); do
    fpath=($HOME/dotFiles/zsh/plugins/oh-my-zsh/plugins/$plugin $fpath)
done
source $HOME/dotFiles/zsh/plugins/oh-my-zsh/oh-my-zsh.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# PRINT INFO ON LOGIN
echo $USER@$HOST

# Keep environment variables in generic profile so other shells can get them
source ~/.profile
fpath=(~/.brew/share/zsh-completions $fpath)

# Aliases
alias g='git'
alias gt='gitit'
alias lsd='ls -aFhlG'
alias l='ls -al'
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format

alias ll='ls -GFhl' # Same as above, but in long listing format
alias 'rm=rm -i' # make rm command (potentially) less destructive
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
alias oo='open .' # open current directory in OS X Finder
alias f='find . -name'
alias grepe='grep -E -R'
alias gg='git grep -i'

alias tls='tmux ls'
alias tas='tmux new-session -A -s 0'
alias tds='tmux detach'
alias tw='tmux new-window'
alias trw='tmux rename-window'
alias tlw='tmux last-window'
alias tnw='tmux next-window'
alias tpw='tmux previous-window'
alias tsw='tmux split-window -v'
alias tswh='tmux split-window -h'
alias tlp='tmux last-pane'
alias tspu='tmux select-pane -U'
alias tspd='tmux select-pane -D'
alias tspd='tmux select-pane -L'
alias tspr='tmux select-pane -R'

# KEY BINDINGS
# Create binding map
typeset -A key

# setup key accordingly
[[ -n "$key[Home]"      ]] && bindkey -- "$key[Home]"      beginning-of-line
[[ -n "$key[End]"       ]] && bindkey -- "$key[End]"       end-of-line
[[ -n "$key[Insert]"    ]] && bindkey -- "$key[Insert]"    overwrite-mode
[[ -n "$key[Backspace]" ]] && bindkey -- "$key[Backspace]" backward-delete-char
[[ -n "$key[Delete]"    ]] && bindkey -- "$key[Delete]"    delete-char
[[ -n "$key[Up]"        ]] && bindkey -- "$key[Up]"        up-line-or-history
[[ -n "$key[Down]"      ]] && bindkey -- "$key[Down]"      down-line-or-history
[[ -n "$key[Left]"      ]] && bindkey -- "$key[Left]"      backward-char
[[ -n "$key[Right]"     ]] && bindkey -- "$key[Right]"     forward-char


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        echoti smkx
    }
    function zle-line-finish () {
        echoti rmkx
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# Keep lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history

# Use modern completion system

autoload -Uz compinit
compinit

# OPTIONS
setopt pushdignoredups
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history # save timestamp of command and duration
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt hist_verify # don't execute, just expand history
setopt share_history # imports new commands and appends typed commands to history

setopt complete_in_word # Allow completion from within a word/phrase
setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
unsetopt menu_complete # do not autoselect the first completion entry
setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word

setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

autoload -U colors && colors

#Completion
setopt AUTO_CD
autoload -U compinit && compinit
zmodload -i zsh/complist

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# insert all expansions for expand completer
# zstyle ':completion:*:expand:*' tag-order all-expansions

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show


# FUNCTIONS
# -------------------------------------------------------------------
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
extract() {
    if [[ -f $1 ]]; then
        case $1 in
          *.tar.bz2) tar xvjf $1;;
          *.tar.gz) tar xvzf $1;;
          *.tar.xz) tar xvJf $1;;
          *.tar.lzma) tar --lzma xvf $1;;
          *.bz2) bunzip $1;;
          *.rar) unrar $1;;
          *.gz) gunzip $1;;
          *.tar) tar xvf $1;;
          *.tbz2) tar xvjf $1;;
          *.tgz) tar xvzf $1;;
          *.zip) unzip $1;;
          *.Z) uncompress $1;;
          *.7z) 7z x $1;;
          *.dmg) hdiutul mount $1;; # mount OS X disk images
          *) echo "'$1' cannot be extracted via >ex<";;
    esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -------------------------------------------------------------------
# display a neatly formatted path
# -------------------------------------------------------------------
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

# vim: sw=2 ts=2 et!
auto-ls () {
  if [[ $#BUFFER -eq 0 ]]; then
    zle && echo ""
    ls
    echo ""
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
      git status
    fi

    zle && zle redisplay
  else
    zle .$WIDGET
  fi
}

zle -N auto-ls
zle -N accept-line auto-ls
add-zsh-hook chpwd auto-ls

# Autocompletion and Syntax Highlighting go last
# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/dotFiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
source $HOME/dotFiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotFiles/zsh/plugins/vim-mode.plugin.zsh
export YSU_MODE=BESTMATCH
export LSCOLORS=exfxcxdxbxexexabagacad

# Check for "required" packages
if ! type "brew" > /dev/null; then
  echo "Homebrew not installed (http://brew.sh/)"
fi
if ! type "npm" > /dev/null; then
  echo "NPM not installed (http://nodejs.org/)"
fi
if ! type "ag" > /dev/null; then
  echo "SilverSearcher not installed (brew install the_silver_searcher)"
fi
if ! type "ctags" > /dev/null; then
  echo "CTags not installed (brew install ctags)"
fi
