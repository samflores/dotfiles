let mapleader=","

"" Pathogen
call pathogen#infect()

"" General
filetype plugin indent on
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
colorscheme twilight256

"" Underline bad spelled words - put here to override colorscheme settings
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

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

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"" Prevent buffer created by fugitive.vim from being hidden
autocmd BufReadPost fugitive://*
      \ set bufhidden=delete

"" Key mappings
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <leader><leader> <c-^>
map <leader>i :set list!<CR>
imap ;; <ESC>:w<CR>

"" Command-T mappings
map <leader>fv :CommandTFlush<CR>\|:CommandT app/views<CR>
map <leader>fV :CommandTFlush<CR>\|:CommandT spec/views<CR>
map <leader>fc :CommandTFlush<CR>\|:CommandT app/controllers<CR>
map <leader>fC :CommandTFlush<CR>\|:CommandT spec/controllers<CR>
map <leader>fm :CommandTFlush<CR>\|:CommandT app/models<CR>
map <leader>fM :CommandTFlush<CR>\|:CommandT spec/models<CR>
map <leader>fr :topleft 100 :split config/routes.rb<CR>
map <leader>fR :CommandTFlush<CR>\|:CommandT spec/requests<CR>
map <leader>fh :CommandTFlush<CR>\|:CommandT app/helpers<CR>
map <leader>fH :CommandTFlush<CR>\|:CommandT spec/helpers<CR>
map <leader>fl :CommandTFlush<CR>\|:CommandT lib<CR>
map <leader>fL :CommandTFlush<CR>\|:CommandT spec/lib<CR>
map <leader>fp :CommandTFlush<CR>\|:CommandT public<CR>
map <leader>fs :CommandTFlush<CR>\|:CommandT public/stylesheets<CR>
map <leader>fS :CommandTFlush<CR>\|:CommandT app/assets/stylesheets<CR>
map <leader>fJ :CommandTFlush<CR>\|:CommandT app/assets/javascripts<CR>
map <leader>ff :CommandTFlush<CR>\|:CommandT features<CR>
map <leader>fe :CommandTFlush<CR>\|:CommandT app/cells<CR>
map <leader>fE :CommandTFlush<CR>\|:CommandT spec/cells<CR>
map <leader>fd :CommandTFlush<CR>\|:CommandT app/decorators<CR>
map <leader>fD :CommandTFlush<CR>\|:CommandT spec/decorators<CR>
map <leader>fg :topleft 100 :split Gemfile<CR>
map <leader>f :CommandTFlush<CR>\|:CommandT<CR>
map <leader>F :CommandTFlush<CR>\|:CommandT %%<CR>

"" Vim-Rails mappings
map <leader>. :A<CR>
map <leader>/ :R<CR>
nmap <leader>r :wa\|!rspec -I. -Ispec %<CR>

"" Fugitive mapping
map <leader>gst :Gstatus<CR>
map <leader>ga  :Gwrite<CR>
map <leader>gco :Gread<CR>
map <leader>gd  :Gdiff<CR>
map <leader>gc  :Gcommit<CR>
map <leader>gca :Gcommit --amend<CR>
map <leader>gra :Git ra<CR>

"" I ALWAYS type 'W' instead 'w'
command! W :w
command! Wa :wa

