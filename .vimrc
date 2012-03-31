let mapleader=","

"" Pathogen
call pathogen#infect()

"" General
filetype plugin indent on
let &winheight=&lines*2/3
let &winwidth=&columns*2/3
set nocompatible                " Vim > Vi
set spell spelllang=en_us       " activate spell checking
set encoding=utf-8              " utf-8 FTW
set showcmd                     " display incomplete commands
set number                      " show line number
set wildmenu                    " cycle on tab completion
set shortmess=atI               " short messages
set clipboard=unnamed           " yank to clipboard
set timeoutlen=500              " don't wait too much
set mouse=a                     " enable mouse support
set nobackup                    " don't save backup files
set wildignore+=*.o,*.obj,.git,tmp/**
set hidden                      " I'm not sure I like this options, but giving it a try
set splitbelow
set splitright

"" Sparkup mapping conflicts with autocompletion
let g:sparkupNextMapping = ']s'

"" Add an space after comment chars
let NERDSpaceDelims=1

"" Status Line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{fugitive#statusline()}%y%{exists('g:loaded_rbenv')?rbenv#statusline():''}%=%-16(\ %l,%c%V\ %)%P

"" Whitespace & Indentation
set autoindent                  " do I need to say what does that mean?
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " indent by 2 spaces
set expandtab                   " use spaces instead tabs
set backspace=indent,eol,start  " backspace can delete anything
set listchars=tab:▸\ ,eol:¬,nbsp:-,trail:-

"" Searching
set hlsearch                    " highlight search
set incsearch                   " incremental search
set ignorecase                  " case insensitive search ...
set smartcase                   " ... unless we have a capital letter

"" Syntax Highlight & Colors
syntax on                       " active syntax highlight
set background=dark             " defaults to dark bg
colorscheme solarized

"" Set winheight and winwidth after terminal resize
autocmd VimResized *
      \ let &winheight=&lines*2/3 |
      \ let &winwidth=&columns*2/3 |
      \ wincmd l | wincmd h |
      \ wincmd j | wincmd k

"" Jump to the last known cursor position on opening
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"" Remove trailing white spaces before saving
autocmd BufWritePre *
      \ let _s=@/ |
      \ let l = line(".") |
      \ let c = col(".") |
      \ %s/\s\+$//e |
      \ let @/=_s |
      \ call cursor(l, c)

autocmd BufWritePost ~/.vimrc source %
autocmd BufWritePost ~/.vim/*.vim source %

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"" Prevent buffer created by fugitive.vim from being hidden
autocmd BufReadPost fugitive://* set bufhidden=delete

"" I ALWAYS type 'W' instead 'w'
command! W :w
command! Wa :wa

so ~/.vim/colors-config.vim
so ~/.vim/mappings-config.vim
so ~/.vim/twitvim-config.vim
