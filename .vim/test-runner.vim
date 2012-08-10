function! RunTestFile(...)
  let in_test_file = match(expand("%"), '\(\.feature\|_mspec\.rb\|_spec\.rb\)$') != -1
  if in_test_file
    let t:saved_test_file=@%
    if a:0
      call SetSingleTestArg()
    endif
  elseif !exists("t:saved_test_file")
    return
  endif
  call RunTests(t:saved_test_file, a:0 ? 1 : 0)
endfunction

function! SetSingleTestArg()
  if !exists('t:saved_test_file')
    return
  endif
  if match(t:saved_test_file, '_mspec.rb$') != -1
    let itline = search("^\\s\\{0,}it", 'bncW')
    let linematch = matchlist(getline(itline), '\(["' . "'" . ']\)\(.\+\)\1')
    let t:single_test_argument=" --name \"/" . get(linematch, 2) . "$/\""
  elseif match(t:saved_test_file, '.feature$') != -1
    let scline = search("^\\s\\{0,}Scenario:", 'bncW')
    let t:single_test_argument=":".scline
  elseif match(t:saved_test_file, '_spec.rb$') != -1
    let itline = search("^\\s\\{0,}it", 'bncW')
    let t:single_test_argument=":".itline
  endif
endfunction

function! RunTests(filename, single_test)
  :w
  if match(a:filename, '.feature$') != -1
    let cmd = 'ruby -I. -S cucumber --no-color '
    let color_argument = ' --color '
  elseif match(a:filename, '_mspec.rb$') != -1
    let cmd = 'turn -I. '
    let color_argument = ' -r minitest/pride '
  elseif match(a:filename, '_spec.rb$') != -1
    let cmd = 'rspec '
    let color_argument = ' --color '
  elseif filereadable("script/test")
    let cmd = 'script/test '
  endif
  if !exists('cmd')
    echo 'No command to run'
    return
  endif
  if filereadable("Gemfile") && (!exists('g:skip_bundler') || g:skip_bundler == 0)
    let cmd = 'bundle exec ' . cmd
  endif
  if exists('g:time_tests') && g:time_tests != 0
    let cmd = 'time ' . cmd
  end
  if exists('g:color_tests') && g:color_tests != 0 && exists('color_argument')
    let cmd = cmd . color_argument
  endif
  let cmd = ':!' . cmd . a:filename
  if exists('t:single_test_argument') && a:single_test == 1
    let cmd = cmd . t:single_test_argument
  end
  exec cmd
endfunction
