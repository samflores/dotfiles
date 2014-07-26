source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fpath=(/usr/local/share/zsh-completions $fpath)

# set default ruby interpreter using chruby
RUBIES=(~/.rubies/*)
chruby 2.1.2

autoload -U compinit
compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
