let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec',
      \ 'ignore_pattern',
      \ '\(target\|plugins\|platforms\|\.svg\|\.jpg\|\.png\|\.ico\|fonts\/\|assets\|_site\|resources\|design\|_components\|bower_components\).*')

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
