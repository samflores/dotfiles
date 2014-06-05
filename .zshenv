# Compiling options
export ARCHFLAGS='-arch x86_64'

# General
export BROWSER='open'
eval "$(locale)"

export PROJECTS_HOME=/Code

# Homebrew
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/share/npm/bin:/usr/local/sbin:$PATH
export PERL5LIB="/Applications/Xcode5.app/Contents/Developer/Library/Perl/5.16/darwin-thread-multi-2level"
export POWERLINE_COMMAND="$HOME/Library/Python/2.7/bin/powerline"

# Ruby interpreter & related options
export SPEC_OPTS='-c'
export RBXOPT="-Xrbc.db=$HOME/.rbc"
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
export EDITOR="vi"

alias irb='irb --simple-prompt'
alias es-start='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.90.0/config/elasticsearch.yml'
alias pcat='pygmentize'
alias mongodr='mongod run --config /usr/local/Cellar/mongodb/2.2.3-x86_64/mongod.conf'

[[ -a ~/.projects ]] && source ~/.projects
