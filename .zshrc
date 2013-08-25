# source $ZSH/oh-my-zsh.sh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# set default ruby interpreter using chruby
RUBIES=(~/.rubies/*)
chruby 2.0.0

bindkey "^[OA" history-search-backward
bindkey "^[OB" history-search-forward
bindkey $terminfo[khome] vi-beginning-of-line
bindkey $terminfo[kend] vi-end-of-line
