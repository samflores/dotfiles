"" Key mappings
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <leader><leader> <c-^>
map <leader>i :set list!<CR>
inoremap jk <ESC>
nnoremap <leader>ch :CloseHiddenBuffers

"" Create CtrlP mappings if the given root directory exists
function! DefineCtrlPMapping(keys, ...)
let paths = copy(a:000)
for path in paths
  if isdirectory(path)
    break
  endif
  unlet path
endfor
if exists('path')
  execute "map <leader>". a:keys . " :CtrlP " . path . "<CR>"
else
  execute "map <leader>". a:keys . " :echo 'No valid directories (" . join(paths, ', ') . ")'<CR>"
endif
endfunction

"" File finder mappings
call DefineCtrlPMapping('ov', 'app/views', 'views')
call DefineCtrlPMapping('oV', 'spec/views')
call DefineCtrlPMapping('ot', 'app/templates', 'template')
call DefineCtrlPMapping('oT', 'spec/templates')
call DefineCtrlPMapping('oc', 'app/controllers', '.')
call DefineCtrlPMapping('oC', 'spec/controllers')
call DefineCtrlPMapping('om', 'app/models', 'models')
call DefineCtrlPMapping('oM', 'spec/models')
call DefineCtrlPMapping('oR', 'spec/requests')
call DefineCtrlPMapping('oh', 'app/helpers')
call DefineCtrlPMapping('oH', 'spec/helpers')
call DefineCtrlPMapping('ol', 'app/libs', 'libs', 'app/lib', 'lib')
call DefineCtrlPMapping('oL', 'spec/libs', 'spec/lib')
call DefineCtrlPMapping('op', 'public', '.')
call DefineCtrlPMapping('os', 'app/assets/stylesheets', 'views/stylesheets', 'app/assets/css', 'views/css')
call DefineCtrlPMapping('oS', 'public/stylesheets', 'public/css')
call DefineCtrlPMapping('oj', 'app/assets/javascripts', 'views/javascripts', 'app/assets/js', 'views/js')
call DefineCtrlPMapping('oJ', 'public/javascripts', 'public/js')
call DefineCtrlPMapping('oF', 'features', 'spec/acceptance', 'spec/features')
call DefineCtrlPMapping('oe', 'app/cells')
call DefineCtrlPMapping('oE', 'spec/cells')
call DefineCtrlPMapping('od', 'app/decorators', 'app/stylists')
call DefineCtrlPMapping('oD', 'spec/decorators', 'spec/stylists')
map <leader>or :topleft 100 :split config/routes.rb<CR>
map <leader>og :topleft 100 :split Gemfile\|set bufhidden=delete<CR>
map <leader>ob :CtrlPBuffer<CR>
map <leader>ou :CtrlPMRU<CR>
map <leader>ot :CtrlPBufTag<CR>
map <leader>oo :CtrlP<CR>
map <leader>o. :CtrlP %%<CR>

"" Vim-Rails mappings
map <leader>. :A<CR>
map <leader>/ :R<CR>

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
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

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
