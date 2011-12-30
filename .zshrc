ZSH=$HOME/Projects/Misc/oh-my-zsh

ZSH_THEME="kong"

CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode rbenv git brew gem bundle)

source $ZSH/oh-my-zsh.sh

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line

