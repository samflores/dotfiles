"" Key mappings
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <leader><leader> <c-^>
map <leader>i :set list!<CR>
inoremap jk <ESC>

"" File finder mappings
map <leader>ov :CtrlP app/views<CR>
map <leader>oV :CtrlP spec/views<CR>
map <leader>oc :CtrlP app/controllers<CR>
map <leader>oC :CtrlP spec/controllers<CR>
map <leader>om :CtrlP app/models<CR>
map <leader>oM :CtrlP spec/models<CR>
map <leader>or :topleft 100 :split config/routes.rb<CR>
map <leader>oR :CtrlP spec/requests<CR>
map <leader>oh :CtrlP app/helpers<CR>
map <leader>oH :CtrlP spec/helpers<CR>
map <leader>ol :CtrlP lib<CR>
map <leader>oL :CtrlP spec/lib<CR>
map <leader>op :CtrlP public<CR>
map <leader>os :CtrlP public/stylesheets<CR>
map <leader>oS :CtrlP app/assets/stylesheets<CR>
map <leader>oJ :CtrlP app/assets/javascripts<CR>
map <leader>of :CtrlP features<CR>
map <leader>oe :CtrlP app/cells<CR>
map <leader>oE :CtrlP spec/cells<CR>
map <leader>od :CtrlP app/decorators<CR>
map <leader>oD :CtrlP spec/decorators<CR>
map <leader>og :topleft 100 :split Gemfile\|set bufhidden=delete<CR>
map <leader>ob :CtrlPBuffer<CR>
map <leader>ou :CtrlPMRU<CR>
map <leader>ot :CtrlPBufTag<CR>
map <leader>oo :CtrlP<CR>
map <leader>o. :CtrlP %%<CR>

"" Vim-Rails mappings
map <leader>. :A<CR>
map <leader>/ :R<CR>
nmap <leader>r :wa\|!rspec -I. -Ispec %<CR>

"" Fugitive mappings
map <leader>gst :Gstatus<CR>
map <leader>ga  :Gwrite<CR>
map <leader>gco :Gread<CR>
map <leader>gd  :Gdiff<CR>
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
inoremap <Up> <nop>
snoremap <Up> <nop>

noremap <Down> <nop>
inoremap <Down> <nop>
snoremap <Down> <nop>

noremap <Left> <nop>
inoremap <Left> <nop>
snoremap <Left> <nop>

noremap <Right> <nop>
inoremap <Right> <nop>
snoremap <Right> <nop>

nnoremap 0 ^
nnoremap 00 0
nnoremap <silent> <leader>C :noh<CR>

nnoremap <silent> <leader>B :let bg = (&background == "light" ? "dark" : "light") \| echom bg \| exec "set background=" . bg . " \| echom &background \| let $TERMBG=bg \| !cp ~/.config/Terminal/terminalrc." . bg . " ~/.config/Terminal/terminalrc"<cr><cr>

"" Run Ruby tests
map <silent> <leader>r :call RunTestFile()<cr>
map <silent> <leader>R :call RunNearestTest()<cr>
map <silent> <leader>a :call RunTests('')<cr>
map <silent> <leader>c :w\|:!script/features<cr>
map <silent> <leader>w :w\|:!script/features --profile wip<cr>

