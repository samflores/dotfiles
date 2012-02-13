# Compiling options
export ARCHFLAGS='-arch x86_64'

# General
export PROJECTS_HOME=/Code

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Ruby interpreter & related options
export SPEC_OPTS='-c'
export RUBYOPT=-Ku
export RBXOPT="-Xrbc.db=$HOME/.rbc -X19"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
export active_ruby="$(rbenv version-name)"

unsetopt auto_name_dirs

export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
export EDITOR="vi"

alias irb='irb --simple-prompt'
alias es-start='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.18.7/config/elasticsearch.yml'
alias pcat='pygmentize'
alias mongodr='mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
