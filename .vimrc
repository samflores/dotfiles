let mapleader=","

"" Pathogen
call pathogen#infect()

"" General
filetype plugin indent on
set winheight=30
set winwidth=40
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

"" Sparkup mappingconflicts with autocompletion
let g:sparkupNextMapping = ']s'

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
colorscheme mango

"" Better colors for diff mode - put here to override colorscheme settings
highlight DiffAdd	ctermbg=2 ctermfg=1
highlight DiffChange	ctermbg=0

"" Better colors for search highlights - put here to override colorscheme settings
highlight IncSearch	cterm=NONE ctermfg=black ctermbg=yellow
highlight Search	cterm=NONE ctermfg=black ctermbg=white

"" Underline bad spelled words - put here to override colorscheme settings
highlight clear SpellBad
highlight SpellBad term=underline cterm=underline ctermfg=1
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"" Autocompletion menu colors
highlight clear Pmenu
highlight Pmenu ctermbg=242 guibg=DarkGrey
highlight clear PmenuSel
highlight PmenuSel ctermbg=13 ctermfg=0 guibg=Magenta

"" Matching parenthesis
highlight clear MatchParen
highlight MatchParen term=underline cterm=underline
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

so ~/.vim/mappings-config.vim

so ~/.vim/twitvim-config.vim
