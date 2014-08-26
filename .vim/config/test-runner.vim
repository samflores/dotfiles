function! RunTests(...)
  let in_test_file = match(expand("%"), '\(\.feature\|_mspec\.rb\|_spec\.rb\|-spec.js\|-test.js\|-test.clj\)$') != -1
  if !in_test_file && !exists("t:saved_test_file")
    return
  endif
  if in_test_file
    let t:saved_test_file=@%
    if a:0
      let t:single_test_argument=s:GetSingleTestArg(t:saved_test_file)
    endif
  endif
  call s:RunTestFile(t:saved_test_file, a:0 ? t:single_test_argument : '')
endfunction

function! s:GetSingleTestArg(filename)
  if match(a:filename, '_mspec.rb$') != -1
    let itline = search("^\\s\\{0,}it", 'bncW')
    let linematch = matchlist(getline(itline), '\(["' . "'" . ']\)\(.\+\)\1')
    return ' --name "/' . get(linematch, 2) . '$/"'
  elseif match(a:filename, '.feature$') != -1
    let scline = search("^\\s\\{0,}Scenario:", 'bncW')
    return ':'.scline
  elseif match(a:filename, '_spec.rb$') != -1
    let itline = search("^\\s\\{0,}it", 'bncW')
    return ':'.itline
  elseif match(a:filename, '-spec.js') != -1
    let itline= search("^\\s*it(", 'bncW')
    let linematch = matchlist(getline(itline), '\(["' . "'" . ']\)\(.\+\)\1')
    return ' --grep "' . get(linematch, 2) . '$"'
  else
    return ' '
  endif
endfunction

function! s:RunTestFile(filename, single_test)
  write
  silent exec ':Make ' . a:filename . a:single_test
endfunction
