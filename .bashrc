# Binaries paths
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:/usr/local/opt/python/libexec/bin"

# Documentation and other files paths
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
export INFOPATH="/usr/local/share/info:/usr/share/info"
export NODE_PATH="/usr/local/lib/node_modules"

# Java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

## Locale and language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Global editor
export EDITOR="subl -n -w"
export VISUAL="subl -n -w"

# Terminal colours
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"

# man colours
man() {
env \
LESS_TERMCAP_mb=$(printf "\e[1;31m") \
LESS_TERMCAP_md=$(printf "\e[1;31m") \
LESS_TERMCAP_me=$(printf "\e[0m") \
LESS_TERMCAP_se=$(printf "\e[0m") \
LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
LESS_TERMCAP_ue=$(printf "\e[0m") \
LESS_TERMCAP_us=$(printf "\e[1;32m") \
man "$@"
}

# Prompting
export TERM="xterm-256color"
GIT_PROMPT_SHOW_LAST_COMMAND_INDICATOR=1
GIT_PROMPT_THEME=Single_line
# GIT_PROMPT_START='\n'
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi


# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

# pip completion
eval "`pip completion --bash`"

# vi input mode for bash
set -o vi
bind -m vi-insert '"\C-l":clear-screen'
bind -m vi-insert '"jk":vi-movement-mode'
bind -m vi-insert '"kj":vi-movement-mode'

# Homebrew synaesthesia
export HOMEBREW_NO_EMOJI=1

# Aliases

## Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias .=pwd
alias ..='cd ..'

alias rm='rm -i'
alias ls='ls -alp'
alias cp='cp -n'
alias mv='mv -i'
alias bcleanup='brew cleanup && sudo rm -rf `brew --cache`'
alias bupdate='brew update && brew outdated'

function goto() { cd $(dirname "$@"); }
function gotow() { cd $(dirname `which "$@"`); }

function cless () { pygmentize -g -O encoding=utf-8 -O style=monokai -f terminal256 "$1" | less -RN; }
function ccat () { pygmentize -g -O encoding=utf-8 -O style=monokai -f terminal256 "$1" | cat -n; }

function div () { echo -e "\e[0;31m" ; printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' / ; echo -e "\e[0m" ; }

alias books='cd ~/Dropbox/Book\ collection'
alias articles='cd ~/Dropbox/Article\ and\ chapter\ collection'
alias avanti='cd ~/Dissertation/avanti'
alias ostracon='cd ~/Dissertation/ostracon'
alias dev='cd ~/Dev'
alias ic="alias ic=cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias subluser='cd /Users/rammos/Library/Application\ Support/Sublime\ Text\ 3/Packages/User'
alias pianonotes='cd ~/PianoNotes'

