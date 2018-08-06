" \[ - previous
" \] - next
" <tab> - next
" \q - close
" \q! - close with force
nnoremap <silent><leader>[ :bpre<CR>
nnoremap <silent><leader> ] :bnext<CR>
nnoremap <silent><leader>q :bd<CR>
nnoremap <silent><leader>q! :bd!<CR>
nnoremap <silent><tab> :bnext<CR>

" hitting enter switches off search highlight
nnoremap <silent><CR> :noh<CR>

" \rv - reloads vimrc
" \ev - open vimrc entry file
nmap <leader>rv :so $MYVIMRC<CR>
nmap <leader>ev :e ~/Dropbox/configs/vim/vimrc.vim<CR>

" \pi - plugin install
" \pr - plugin remove
nmap <leader>pi :call dein#install()<CR>
nmap <leader>pr :call map(dein#check_clean(), "delete(v:val, 'rf')")<CR> :call dein#recache_runtimepath()<CR>

" \gb - git blame in split
nmap <leader>gb :Gblame<CR>

" \e - emmet expand
nmap <silent><leader>e :call emmet#expandAbbr(3, "")<CR>

" replaces pdb -> import pdb; pdb.set_trace()
abbreviate pdb import pdb; pdb.set_trace()

" replaces lorem -> lorem text :-)
abbreviate lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit

" ctrlp runs fzf
nmap <C-P> :Files<CR>

" ctrl o runs :Ag
nnoremap <C-O> :Ag<CR>

" ctrl I runs :Ag with word under cursor
"nmap <C-I> :Ag <C-R><C-W><CR>

" moving from split to split remap, with ctrl - hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" \cc - camel case to underscore
nnoremap <leader>cc :s#\(\<\u\l\+\\|\l\+\)\(\u\)#\l\1_\l\2#g<CR>

" nerd commenter
" toggles comments --> #
nmap # <leader>c<Space>
vmap # <leader>c<Space>

" uppercase file operations commands
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
:command! QA qall
:command! Qa qall
:command! Xa xall
:command! XA xall

" on file save strip trailing whitespaces
autocmd FileType c,cpp,cfg,htmldjango,html,python,javascript,typescript,json,vim,markdown,vue autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" function which removes white spaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
