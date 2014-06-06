"" Folding
set fillchars=fold:\ ,vert:\⎸
set foldtext=MyFoldFunction()
set nofoldenable
set foldlevel=4
set foldmethod=manual

function! MyFoldFunction()
  let line = getline(v:foldstart)
  let lastline = getline(v:foldend)
  let numfolded = v:foldend - v:foldstart
  return line . '  (+' . numfolded . ' lines)'
endfunction
