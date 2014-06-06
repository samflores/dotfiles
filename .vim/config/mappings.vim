"" Key mappings
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <leader><leader> <c-^>
map <leader>i :set list!<CR>
inoremap jk <ESC>
nnoremap <leader>ch :CloseHiddenBuffers

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
map <leader>vv :vsplit ~/.vimrc\|set bufhidden=delete<CR>
map <leader>vm :vsplit ~/.vim/mappings-config.vim\|set bufhidden=delete<CR>
map <leader>vt :vsplit ~/.vim/test-runner.vim\|set bufhidden=delete<CR>
map <leader>vb :vsplit ~/.vim/Vimfile\|set bufhidden=delete<CR>

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
