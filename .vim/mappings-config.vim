"" Key mappings
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <leader><leader> <c-^>
map <leader>i :set list!<CR>
inoremap jk <ESC>
nnoremap <leader>ch :CloseHiddenBuffers

"" Receives a list of directories as argument and executes CtrlP for the first one that exists
function! CtrlPToDirList(...)
  let paths = copy(a:000)
  for path in paths
    let path = glob(path)
    if isdirectory(path)
      break
    endif
    unlet path
  endfor
  if exists('path')
    execute "CtrlP " . path
  else
    execute "echo 'No valid directories (" . join(paths, ', ') . ")'"
  end
endfunction

"" Associates a mapping to a list of directories
function! DefineCtrlPMapping(keys, ...)
  let paths = copy(a:000)
  execute "map <leader>" . a:keys . " :call CtrlPToDirList('" . join(paths, "', '") . "')<cr>"
endfunction

"" File finder mappings
call DefineCtrlPMapping('ov', 'app/views', 'views', 'src/*/views')
call DefineCtrlPMapping('oV', 'spec/views', 'test/*/views')
call DefineCtrlPMapping('ot', 'app/templates', 'templates', 'src/*/templates')
call DefineCtrlPMapping('oT', 'spec/templates')
call DefineCtrlPMapping('oc', 'app/controllers', 'controllers', '.')
call DefineCtrlPMapping('oC', 'spec/controllers')
call DefineCtrlPMapping('om', 'app/models', 'models', 'src/*/models')
call DefineCtrlPMapping('oM', 'spec/models', 'test/*/models')
call DefineCtrlPMapping('oR', 'spec/requests')
call DefineCtrlPMapping('oh', 'app/helpers')
call DefineCtrlPMapping('oH', 'spec/helpers')
call DefineCtrlPMapping('ol', 'app/libs', 'libs', 'app/lib', 'lib')
call DefineCtrlPMapping('oL', 'spec/libs', 'spec/lib')
call DefineCtrlPMapping('op', 'public', '.')
call DefineCtrlPMapping('os', 'app/assets/stylesheets', 'views/stylesheets', 'app/assets/css', 'views/css')
call DefineCtrlPMapping('oS', 'public/stylesheets', 'public/css', 'resources/public/css')
call DefineCtrlPMapping('oj', 'app/assets/javascripts', 'views/javascripts', 'app/assets/js', 'views/js')
call DefineCtrlPMapping('oJ', 'public/javascripts', 'public/js', 'resources/public/js')
call DefineCtrlPMapping('oF', 'features', 'spec/acceptance', 'spec/features')
call DefineCtrlPMapping('oe', 'app/cells')
call DefineCtrlPMapping('oE', 'spec/cells')
call DefineCtrlPMapping('od', 'app/decorators', 'app/stylists')
call DefineCtrlPMapping('oD', 'spec/decorators', 'spec/stylists')
map <leader>or :topleft 100 :split config/routes.rb<CR>
map <leader>og :topleft 100 :split Gemfile\|set bufhidden=delete<CR>
map <leader>ob :CtrlPBuffer<CR>
map <leader>ou :CtrlPMRU<CR>
map <leader>o\ :CtrlPTag<CR>
map <leader>o[ :CtrlPBufTag<CR>
map <leader>o] :CtrlPBufTagAll<CR>
map <leader>oo :CtrlP<CR>
map <leader>o. :CtrlP %%<CR>
map <leader>o  <nop>

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
map <silent> <leader>R :call RunTestFile(1)<cr>
map <silent> <leader>a :call RunTests('')<cr>
