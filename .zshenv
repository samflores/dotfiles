# Compiling options
export ARCHFLAGS='-arch x86_64'
export LDFLAGS="$LDFLAGS /usr/local/Cellar/readline/6.2.2/lib"
export CPPFLAGS="$CPPFLAGS /usr/local/Cellar/readline/6.2.2/include"

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Ruby interpreter & related options
export SPEC_OPTS='-c'
export RUBYOPT=-Ku
export RBXOPT="-Xrbc.db=$HOME/.rbc -X19 -Xint"

# rbenv
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"
export active_ruby=$(rbenv version-name)

unsetopt auto_name_dirs

alias vi=/usr/local/Cellar/macvim/7.3-63/MacVim.app/Contents/MacOS/Vim
export EDITOR="vi"

alias irb='irb --simple-prompt'
alias es-start='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.18.5/config/elasticsearch.yml'
alias pcat='pygmentize'

