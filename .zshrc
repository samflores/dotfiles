# source $ZSH/oh-my-zsh.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# set default ruby interpreter using chruby
RUBIES=(/opt/rubies/*)
chruby 1.9.3

bindkey "^[OA" history-search-backward
bindkey "^[OB" history-search-forward
bindkey $terminfo[khome] vi-beginning-of-line
bindkey $terminfo[kend] vi-end-of-line
