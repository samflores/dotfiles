let mapleader=","
set nocompatible                " Vim > Vi
filetype off

so $HOME/.vim/config/bundle.vim

"" General
filetype plugin indent on
let &winheight=&lines*2/3
let &winwidth=&columns*2/3
set undofile
set undodir=~/.vim/undos
set directory+=,$HOME/.vim/temp,$TMP
set spelllang=en_us,pt_br       " activate spell checking
set encoding=utf-8              " utf-8 FTW
set showcmd                     " display incomplete commands
set number                      " show line number
set wildmenu                    " cycle on tab completion
set completeopt=longest,menuone
set shortmess=atI               " short messages
set clipboard=unnamed           " yank to clipboard
set timeoutlen=300              " don't wait too much
set mouse=a                     " enable mouse support
set nobackup                    " don't save backup files
set cursorline                  " highlight current line
set wildignore+=*.o,*.obj,.git,tmp/**
set wildignore+=public/assets/*,public/sprockets/**
set wildignore+=*node_modules/**
set wildignore+=*resources/public/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=.project,*.lock
set wildignore+=*.class,*.jar,tags
set wildignore+=coverage
set wildignore+=*.min.js,*.min.css
set wildignore+=.*
set hidden                      " I'm not sure I like this options, but giving it a try
set splitbelow
set splitright
set viminfo=!,'1000,f1,<500,:100,@10
set title

"" Status Line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{fugitive#statusline()}%y%=%-16(\ %l,%c%V\ %)%P

"" Whitespace & Indentation
set autoindent                  " do I need to say what does that mean?
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " indent by 2 spaces
set expandtab                   " use spaces instead tabs
set backspace=indent,eol,start  " backspace can delete anything
set smartindent
set listchars=tab:▸\ ,eol:¬,nbsp:+,trail:-,extends:>,precedes:<
set scrolloff=1

"" Searching
set hlsearch                    " highlight search
set incsearch                   " incremental search
set ignorecase                  " case insensitive search ...
set smartcase                   " ... unless we have a capital letter

"" use Silver Searcher instead of Grep
set grepprg=ag\ --nogroup\ --nocolor\ --column

"" Syntax Highlight & Colors
syntax on                       " active syntax highlight
set background=dark
colorscheme ToyChest

"" Change cursor between modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"" I ALWAYS type 'W' instead 'w'
command! W :w
command! Wa :wa
command! Ww :silent execute 'w !sudo tee %>/dev/null' | e!

so $HOME/.vim/config/folding.vim
so $HOME/.vim/config/completion.vim
so $HOME/.vim/config/unite.vim
so $HOME/.vim/config/snippets.vim
so $HOME/.vim/config/autocommands.vim
so $HOME/.vim/config/close-hidden.vim
so $HOME/.vim/config/mappings.vim
so $HOME/.vim/config/powerline.vim
