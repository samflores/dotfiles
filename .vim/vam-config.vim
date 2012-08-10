fun! EnsureVamIsOnDisk(vam_install_path)
  let is_installed_c = "isdirectory(a:vam_install_path.'/vim-addon-manager/autoload')"
  if eval(is_installed_c)
    return 1
  else
    if 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
      " I'm sorry having to add this reminder. Eventually it'll pay off.
      call confirm("Remind yourself that most plugins ship with ".
            \"documentation (README*, doc/*.txt). It is your ".
            \"first source of knowledge. If you can't find ".
            \"the info you're looking for in reasonable ".
            \"time ask maintainers to improve documentation")
      call mkdir(a:vam_install_path, 'p')
      execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
      " VAM runs helptags automatically when you install or update plugins
      exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
    endif
    return eval(is_installed_c)
  endif
endf

fun! ReadAddonsList(file)
  let all_addons = readfile(expand(a:file))
  let g:filetype_addons = {}
  let common_addons = []
  for line in all_addons
    if line =~ '\s\+=>\s\+'
      let regex = substitute(line, '^\(.\+\)\s\+=>\s\+\(.\+\)$', '\2', '')
      if !has_key(g:filetype_addons, regex)
        let g:filetype_addons[regex] = []
      endif
      let plugin = substitute(line, '^\(.\+\)\s\+=>\s\+\(.\+\)$', '\1', '')
      let plugin = substitute(plugin, '\s\+$', '', '')
      let g:filetype_addons[regex] += [plugin]
    elseif line != ''
      let common_addons += [line]
    endif
  endfor
  au FileType *
        \ for l in values(filter(copy(g:filetype_addons), string(expand('<amatch>')).' =~ v:key')) |
        \   call vam#ActivateAddons(l, {'force_loading_plugins_now':1}) |
        \ endfor
  call vam#ActivateAddons(common_addons, {'auto_install' : 0})
endf

fun! SetupVAM()
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  if !EnsureVamIsOnDisk(vam_install_path)
    echohl ErrorMsg
    echomsg "No VAM found!"
    echohl NONE
    return
  endif
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  call vam#ActivateAddons([], {'auto_install' : 0})
endfun

call SetupVAM()
call ReadAddonsList('~/.vim/addons')
