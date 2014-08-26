if has('vim_starting')
  set nocompatible               " Be iMproved

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-build'
NeoBundle 'osyo-manga/unite-quickfix'

NeoBundle 'vim-scripts/javacomplete'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'amdt/vim-niji'
NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'mxw/vim-jsx'

NeoBundle 'wting/rust.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'godlygeek/tabular'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'tpope/vim-projectionist'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
