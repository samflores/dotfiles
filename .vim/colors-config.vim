" Better colors for diff mode - put here to override colorscheme settings
highlight DiffAdd	ctermbg=2 ctermfg=1
highlight DiffChange	ctermbg=0

" Better colors for search highlights - put here to override colorscheme settings
highlight IncSearch	cterm=NONE ctermfg=black ctermbg=yellow
highlight Search	cterm=NONE ctermfg=black ctermbg=white

" Underline bad spelled words - put here to override colorscheme settings
highlight clear SpellBad
highlight SpellBad term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Autocompletion menu colors
highlight clear Pmenu
highlight Pmenu ctermbg=242 guibg=DarkGrey
highlight clear PmenuSel
highlight PmenuSel ctermbg=13 ctermfg=0 guibg=Magenta

" Matching parenthesis
highlight clear MatchParen
highlight MatchParen term=underline cterm=underline

