"" Key mappings
cnoremap %% <C-R>=expand('%:h').'/'<CR>

"" General mappings
nnoremap <leader><leader> <c-^>
map <leader>i :set list!<CR>
inoremap jk <ESC>
inoremap ;w <ESC>:w<CR>a

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

"" Quickly edit configuration files
map <leader>ev :vsplit ~/.vimrc<CR>
map <leader>em :vsplit ~/.vim/mappings-config.vim<CR>

"" Move lines
nmap - ddkP2==
nmap + ddpk2==j

"" Move between split windows
nnoremap <silent> <leader>h :wincmd h<cr>
nnoremap <silent> <leader>j :wincmd j<cr>
nnoremap <silent> <leader>k :wincmd k<cr>
nnoremap <silent> <leader>l :wincmd l<cr>

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

nnoremap 0 0w
nnoremap 00 0
nnoremap <silent> <leader>C :noh<CR>
