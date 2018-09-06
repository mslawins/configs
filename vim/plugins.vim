" gruvbox
let g:gruvbox_contrast_dark = 'hard' " higher contrast than normal
colorscheme gruvbox " colorscheme must be set after plugin settings

" airline
let g:airline#extensions#tabline#enabled = 1 " enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " show only file name in buffer bar
let g:airline#extensions#ale#enabled = 1 " enavle vim-airline ale plugin

" match tags always
let g:mta_use_matchparen_group = 0 " switch off default and set up color below
highlight MatchTag ctermfg=darkred ctermbg=lightgreen guifg=darkred guibg=lightgreen

" vim markdown preview
let vim_markdown_preview_toggle=3 " reloads preview on buffer save
let vim_markdown_preview_github=0 " standard markdown by default

" vim js pretty template auto run in typescript
autocmd FileType typescript JsPreTmpl html

" colorizer - run in css related file types
autocmd FileType css ColorHighlight
autocmd FileType scss ColorHighlight
autocmd FileType sass ColorHighlight

" nerd commenter
let g:NERDDefaultAlign = 'left' " align comment signs to left by default

" you complete me triggers
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers['typescript'] = ['.']
let g:ycm_semantic_triggers['python'] = ['.']
let g:ycm_semantic_triggers['css'] = [ 're!^\s{2}', 're!:\s+' ]
let g:ycm_semantic_triggers['scss'] = [ 're!^\s{2}', 're!:\s+' ]

" emmet
" allow emmet only in html
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall

" set indentation to two spaces
let g:user_emmet_settings = {
\    'indentation' : '  '
\}

" fzf does not show .gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" runs :Ag with code preview
command! -bang -nargs=* Ag
   \ call fzf#vim#ag(<q-args>,
   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
   \                         : fzf#vim#with_preview('right:50%'),
   \                 <bang>0)

" vim polyglot
" vue syntax is now faster
let g:vue_disable_pre_processors=1

" unisnippets
let g:UltiSnipsExpandTrigger = '<C-s>s'

" vim ale
" next three lines are error msg format to include linter name
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'

" does not run check when typing
let g:ale_lint_on_text_changed = 'never'

let b:ale_linters = ['pylint']
