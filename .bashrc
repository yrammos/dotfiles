# Paths: tmux seems to invoke path_helper, so we need to
# do some trickery to avoid reordering of paths.
export PATH=":"
eval `/usr/libexec/path_helper -s`
export PATH="$PATH:$HOME/.cabal/bin:/usr/local/share/npm/bin:/usr/texbin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
eval "rvm gemset use default > /dev/null"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export INFOPATH="/usr/local/share/info:/usr/share/info"
export NODE_PATH=/usr/local/lib/node_modules

# Add DocBook in XML toolchain
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

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
[ -n "$TMUX" ] && export TERM=screen-256color
# GIT_PROMPT_SHOW_LAST_COMMAND_INDICATOR=1
# source /usr/local/opt/bash-git-prompt/share/gitprompt.sh
export PS1='$(if [[ $? = "0" ]]; then echo "\[\e[37m\]"; else echo "\[\e[31m\]❗ "; fi)[\t] \w ▶ \[\e[0m\]'

source /Users/rammos/Dev/oh-my-git/prompt.sh

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

# tmuxinator completion
source /Users/rammos/Dev/tmuxinator/bin/tmuxinator_completion

# Aliases
alias .=pwd
alias ..='cd ..'

alias proxyon='networksetup -setautoproxystate Wi-Fi on'
alias proxyoff='networksetup -setautoproxystate Wi-Fi off'
alias proxystatus='networksetup -getautoproxyurl Wi-Fi'

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

alias rusgram='open ~/Documents/Non-music/LearnRussian/learnrussian.rt.com/grammar-tables/index.html'
alias books='cd ~/Dropbox/Book\ collection'
alias articles='cd ~/Dropbox/Article\ and\ chapter\ collection'
alias avanti='cd ~/Dissertation/avanti'
alias ostracon='cd ~/Dissertation/ostracon'
alias nyustein='cd ~/Dissertation/nyustein'
alias dev='cd ~/Dev'
alias ic="alias ic=cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias subluser='cd /Users/rammos/Library/Application\ Support/Sublime\ Text\ 3/Packages/User'
alias pianonotes='cd ~/PianoNotes'
alias pianonotesedit='subl ~/PianoNotes/PianoNotes.sublime-project'

