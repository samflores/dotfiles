"" Show MRU files for the current project only
let g:ctrlp_mruf_relative = 1
""
let g:ctrlp_match_window_reversed = 0
"" Disable CtrlP default mapping
let g:ctrlp_map = ''
"" Mark Eclipse projects as CtrlP root
let g:ctrlp_root_markers = ['.project']

let g:ctrlp_status_func = {
\ 'main': 'CtrlPMainStatusLine',
\ 'prog': 'CtrlPProgStatusLine',
\ }

function! CtrlP_Statusline_1(...)
  let item = '%#Character# '.a:5.' %*'
  let marked = a:7 == ' <->' ? '' : a:7
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  return item.marked.dir
endfunction

function! CtrlP_Statusline_2(...)
  let len = '%#Function# '.a:1.' %*'
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  return len.dir
endfunction
