"" Key mappings
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <leader><leader> <c-^>
map <leader>i :set list!<CR>
inoremap jk <ESC>
nnoremap <leader>ch :CloseHiddenBuffers

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
nnoremap <leader>f :<C-u>Unite -start-insert -no-split file_rec<CR>

"" Fugitive mappings
map <leader>gws :Gstatus<CR>
map <leader>gia :Gwrite<CR>
map <leader>gco :Gread<CR>
map <leader>gwd :Gdiff<CR>
map <leader>gc  :Gcommit<CR>
map <leader>gca :Gcommit --amend<CR>
map <leader>gra :Git ra<CR>

"" Quickly edit configuration files
map <Leader>vv :vsplit ~/.vimrc\|set bufhidden=delete<CR>
map <Leader>vm :vsplit ~/.vim/config/mappings.vim\|set bufhidden=delete<CR>
map <Leader>vt :vsplit ~/.vim/config/test-runner.vim\|set bufhidden=delete<CR>
map <Leader>vb :vsplit ~/.vim/config/bundle.vim\|set bufhidden=delete<CR>

"" Move between split windows
nnoremap <silent> <leader>h :wincmd h<cr>
nnoremap <silent> <leader>j :wincmd j<cr>
nnoremap <silent> <leader>k :wincmd k<cr>
nnoremap <silent> <leader>l :wincmd l<cr>
nnoremap <silent> <leader>H :wincmd H<cr>
nnoremap <silent> <leader>J :wincmd J<cr>
nnoremap <silent> <leader>K :wincmd K<cr>
nnoremap <silent> <leader>L :wincmd L<cr>

"" Force myself to use hjkl instead arrows
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap 0 ^
nnoremap <leader>0 0
nnoremap <silent> <C-k> :noh<CR>

"" Syntax highlight details
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
