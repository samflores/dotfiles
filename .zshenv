# Compiling options
export ARCHFLAGS='-arch x86_64'

# General
export BROWSER='open'
eval "$(locale)"

export PROJECTS_HOME=/Code

# Homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Ruby interpreter & related options
export SPEC_OPTS='-c'
export RUBYOPT=-Ku
export RBXOPT="-Xrbc.db=$HOME/.rbc -X19"
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
export EDITOR="vi"

alias irb='irb --simple-prompt'
alias es-start='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.20.4/config/elasticsearch.yml'
alias pcat='pygmentize'
alias mongodr='mongod run --config /usr/local/Cellar/mongodb/2.2.3-x86_64/mongod.conf'

source ~/.projects
