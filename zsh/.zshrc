# Path to your oh-my-zsh installation.
export ZSH=/Users/franz/.oh-my-zsh
ZSH_THEME=frankenstein
source $ZSH/oh-my-zsh.sh

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

# Git aliases
# See .gitconfig

# Damage Report!
alias wtf="ls && echo && git status && git log -1"
# Make some random strings
alias rando="cat /dev/urandom | base64 | tr -dc 'a-km-zA-KM-Z02-9-_!@#$%^&*+|' | fold -w 16 | head -n 4"
# Print lorem ipsum paragraph
alias lorem="echo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc."
# Get the weather
alias weather="curl wttr.in"

# KEY BINDINGS
# Create binding map
typeset -A key

key[Home]="$terminfo[khome]"
key[End]="$terminfo[kend]"
key[Insert]="$terminfo[kich1]"
key[Backspace]="$terminfo[kbs]"
key[Delete]="$terminfo[kdch1]"
key[Up]="$terminfo[kcuu1]"
key[Down]="$terminfo[kcud1]"
key[Left]="$terminfo[kcub1]"
key[Right]="$terminfo[kcuf1]"
key[PageUp]="$terminfo[kpp]"
key[PageDown]="$terminfo[knp]"

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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

source $HOME/.brew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/git-it-on/git-it-on.plugin.zsh
source ~/.zsh/pretty-time/pretty-time.zsh
source ~/.zsh/ssh-connect/ssh-connect/ssh-connect.sh
source ~/.fzf.zsh
source ~/.zsh/you-should-use/you-should-use.zsh
export YSU_MODE=BESTMATCH

bindkey '^P' fuzzy-search-and-edit

export LSCOLORS=exfxcxdxbxexexabagacad
