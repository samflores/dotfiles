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

function! AutoSave()
  let blacklist = ['unite', 'qf']
  if index(blacklist, &ft) < 0
    write
  endif
endfunction

"" Update window title according to buffer
autocmd! BufEnter *    let &titlestring=expand("%:t")
autocmd! InsertEnter * let &titlestring=expand("%:t") . " - INSERT"
autocmd! InsertLeave * let &titlestring=expand("%:t") | call AutoSave()

"" Remove trailing white spaces before saving
autocmd! BufWritePre *
      \ let _s=@/ |
      \ let l = line(".") |
      \ let c = col(".") |
      \ %s/\s\+$//e |
      \ let @/=_s |
      \ call cursor(l, c)

"" Reload configs on save
autocmd! BufWritePost ~/.vimrc source %
autocmd! BufWritePost ~/.vim/config/*.vim source %

"" Prevent buffer created by fugitive.vim from being hidden
autocmd! BufReadPost fugitive://* set bufhidden=delete

" NeoCompletion Omni completion
autocmd! FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd! FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd! FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd! FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
autocmd! FileType java          setlocal omnifunc=javacomplete#Complete

autocmd! BufEnter *-spec.js  compiler mocha
autocmd! BufEnter *_mspec.rb compiler minitest
autocmd! BufEnter *_spec.rb  compiler rspec
autocmd! BufEnter *.feature  compiler cucumber

autocmd! CmdwinEnter *        call UnmapCR()
autocmd! CmdwinLeave *        call MapCR()
