function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(\.feature\|_mspec\.rb\|_spec\.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  endif
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  if match(a:filename, '.feature$') != -1
    let cmd = 'ruby -I. -S cucumber '
  elseif match(a:filename, '_mspec.rb$') != -1
    let cmd = 'ruby -I. '
  else
    if filereadable("script/test")
      let cmd = 'script/test '
    else
      let cmd = 'rspec --color '
    endif
  endif
  if filereadable("Gemfile") && !exists('g:skip_bundler')
    let cmd = 'bundle exec ' . cmd
  endif
  exec ':!' . cmd . a:filename
endfunction
