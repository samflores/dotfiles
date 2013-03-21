let mapleader=","
set nocompatible                " Vim > Vi
filetype off

let g:EclimBaseDir="~/.vim/vim-addons/eclim"
set rtp+="~/.vim/vim-addons/eclim"
"" Vim Addon Manager
so ~/.vim/vam-config.vim

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
set timeoutlen=500              " don't wait too much
set mouse=a                     " enable mouse support
set nobackup                    " don't save backup files
set cursorline                  " highlight current line
set wildignore+=*.o,*.obj,.git,tmp/**
set wildignore+=public/assets/**,public/sprockets/**
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
set listchars=tab:▸\ ,eol:¬,nbsp:-,trail:-

"" Searching
set hlsearch                    " highlight search
set incsearch                   " incremental search
set ignorecase                  " case insensitive search ...
set smartcase                   " ... unless we have a capital letter

"" Folding
set fillchars=fold:\ ,vert:\⎸
set foldtext=MyFoldFunction()
set nofoldenable
set foldlevel=4
set foldmethod=manual

function! MyFoldFunction()
  let line = getline(v:foldstart)
  let lastline = getline(v:foldend)
  let numfolded = v:foldend - v:foldstart
  return line . '  (+' . numfolded . ' lines)'
endfunction

let g:is_mzscheme = 1

"" DBExt
let g:dbext_default_history_file = '.dbext_history'

"" Add an space after comment chars
let NERDSpaceDelims=1

"" Clojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let vimclojure#FuzzyIndent = 1

"" ZenCoding
let g:user_zen_expandabbr_key = ',zz'
let g:user_zen_expandword_key = ',zw'
let g:user_zen_balancetaginward_key = ',zi'
let g:user_zen_balancetagoutward_key = ',zo'
let g:user_zen_next_key = ']t'
let g:user_zen_prev_key = '[t'
let g:user_zen_imagesize_key = ',zp'
let g:user_zen_togglecomment_key = ',z/'
let g:user_zen_splitjointag_key = ',zj'
let g:user_zen_removetag_key = ',zk'
let g:user_zen_anchorizeurl_key = ',za'
let g:user_zen_anchorizesummary_key = ',zA'

"" EasyMotion
let g:EasyMotion_leader_key = '\'

"" SuperTab
let g:SuperTabLongestHighlight = 1

"" XpTemplate + SuperTab
"" avoid key conflict
let g:SuperTabMappingForward = '<Plug>supertabKey'
"" if nothing matched in xpt, try supertab
let g:xptemplate_fallback = '<Plug>supertabKey'
"" xpt uses <tab> as trigger key
let g:xptemplate_key = '<Tab>'

"" use Silver Searcher with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

"" html5 indent
let g:html_indent_tags="section\|article\|header\|footer\|nav\|li\|p\|a"

"" Syntax Highlight & Colors
syntax on                       " active syntax highlight
let bg=substitute(system("~/bin/terminal_theme"), "\\n", "", "")
let &background=bg
colorscheme solarized

"" Set winheight and winwidth after terminal resize
autocmd! VimResized *
      \ let &winheight=&lines*2/3 |
      \ let &winwidth=&columns*2/3 |
      \ wincmd l | wincmd h |
      \ wincmd j | wincmd k

"" Jump to the last known cursor position on opening
autocmd! BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

autocmd! BufEnter *
      \ let &titlestring=expand("%:t")

autocmd! InsertEnter *
      \ let &titlestring=expand("%:t") . " - INSERT"

autocmd! InsertLeave *
      \ let &titlestring=expand("%:t")

"" Remove trailing white spaces before saving
autocmd! BufWritePre *
      \ let _s=@/ |
      \ let l = line(".") |
      \ let c = col(".") |
      \ %s/\s\+$//e |
      \ let @/=_s |
      \ call cursor(l, c)

autocmd! BufWritePost ~/.vimrc source %
autocmd! BufWritePost ~/.vim/*.vim source %

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=2\x7"

"" Prevent buffer created by fugitive.vim from being hidden
autocmd! BufReadPost fugitive://* set bufhidden=delete

"" I ALWAYS type 'W' instead 'w'
command! W :w
command! Wa :wa
command! Ww :silent execute 'w !sudo tee %>/dev/null' | e!

so ~/.vim/close-hidden.vim
so ~/.vim/test-runner.vim
so ~/.vim/colors-config.vim
so ~/.vim/mappings-config.vim
so ~/.vim/ctrlp-config.vim
