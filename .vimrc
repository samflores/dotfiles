let mapleader=","
filetype off

"" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/Vimfile

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
set wildignore+=public/assets/**,public/sprockets/**
set wildignore+=*.png,*.jpg
set hidden                      " I'm not sure I like this options, but giving it a try
set splitbelow
set splitright
set viminfo='1000,f1,<500,:100,@10,@10

"" Sparkup mapping conflicts with autocompletion
let g:sparkupNextMapping = ']s'

"" Add an space after comment chars
let NERDSpaceDelims=1

"" Status Line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{fugitive#statusline()}%y%=%-16(\ %l,%c%V\ %)%P

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
set t_Co=256
colorscheme xoria256

"" Indent <p> and <li> tags
autocmd TabEnter,WinEnter,BufWinEnter *.html,*.erb let g:html_indent_tags = g:html_indent_tags.'\|p\|li'

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

autocmd InsertEnter * silent execute "!/usr/local/bin/beam_cursor.sh"
autocmd InsertLeave * silent execute "!/usr/local/bin/block_cursor.sh"

"" Prevent buffer created by fugitive.vim from being hidden
autocmd BufReadPost fugitive://* set bufhidden=delete

"" I ALWAYS type 'W' instead 'w'
command! W :w
command! Wa :wa

so ~/.vim/colors-config.vim
so ~/.vim/mappings-config.vim
