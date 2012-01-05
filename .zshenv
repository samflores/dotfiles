# Compiling options
export ARCHFLAGS='-arch x86_64'

# General
export PROJECTS_HOME=/Code

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Ruby interpreter & related options
export SPEC_OPTS='-c'
export RUBYOPT=-Ku
export RBXOPT="-Xrbc.db=$HOME/.rbc -X19 -Xint"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
export active_ruby="$(rbenv version-name)"

unsetopt auto_name_dirs

export EDITOR="vi"

alias irb='irb --simple-prompt'
alias es-start='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.18.6/config/elasticsearch.yml'
alias pcat='pygmentize'

