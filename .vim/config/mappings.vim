"" Key mappings
cnoremap %% <c-r>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <Leader><Leader> <c-^>
map <Leader>i :set list!<CR>
nnoremap <Leader>ch :CloseHiddenBuffers<CR>
nnoremap 0 ^
nnoremap <Leader>0 0
nnoremap <silent> <c-k> :noh<CR>

"" Test Runner
function! MapCR()
  nnoremap <silent> <CR>         :call RunTests(1)<CR>
  nnoremap <silent> <Leader><CR> :call RunTests()<CR>
endfunction

function! UnmapCR()
  nnoremap <CR> <CR>
endfunction
call MapCR()

"" Unite mappings
nnoremap <Leader>t :<c-u>Unite -no-split -buffer-name=files    -start-insert file_rec<CR>
nnoremap <Leader>f :<c-u>Unite -no-split -buffer-name=files    -start-insert file<CR>
nnoremap <Leader>r :<c-u>Unite -no-split -buffer-name=mru      -start-insert file_mru<CR>
nnoremap <Leader>o :<c-u>Unite -no-split -buffer-name=outline  -start-insert outline<CR>
nnoremap <Leader>y :<c-u>Unite -no-split -buffer-name=yank     history/yank<CR>
nnoremap <Leader>e :<c-u>Unite -no-split -buffer-name=buffer   buffer<CR>
nnoremap <Leader>b :<c-u>Unite -no-split -buffer-name=build    build<CR>
nnoremap <Leader>x :<c-u>Unite -no-split -buffer-name=quickfix quickfix<CR>

"" NeoSnippet mappings
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

"" Fugitive mappings>
map <Leader>gws :Gstatus<CR>
map <Leader>gia :Gwrite<CR>
map <Leader>gco :Gread<CR>
map <Leader>gwd :Gvdiff<CR>
map <Leader>gc  :Gcommit<CR>
map <Leader>gca :Gcommit --amend<CR>
map <Leader>gra :Git ra<CR>

"" Quickly edit configuration files
map <Leader>vv :vsplit ~/.vimrc\|set bufhidden=delete<CR>
map <Leader>vm :vsplit ~/.vim/config/mappings.vim\|set bufhidden=delete<CR>
map <Leader>vt :vsplit ~/.vim/config/test-runner.vim\|set bufhidden=delete<CR>
map <Leader>vb :vsplit ~/.vim/config/bundle.vim\|set bufhidden=delete<CR>

"" Move between split windows
nnoremap <silent> <Leader>h :wincmd h<CR>
nnoremap <silent> <Leader>j :wincmd j<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>
nnoremap <silent> <Leader>l :wincmd l<CR>
nnoremap <silent> <Leader>H :wincmd H<CR>
nnoremap <silent> <Leader>J :wincmd J<CR>
nnoremap <silent> <Leader>K :wincmd K<CR>
nnoremap <silent> <Leader>L :wincmd L<CR>

"" Force myself to use hjkl instead arrows
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"" Syntax highlight details
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
