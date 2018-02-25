" fast test runner
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" usage:
" leader t - one test with current cursor position
" leader tt - one test with current cursor position, with clear database
" leader T - all tests in file
let g:Commands = {'one-lte-backlog': 'docker-compose exec backend pytest', 'aginoodle': '/home/mslawins/Aginoodle/aginoodle/bin/py.test', 'marta-pro': 'docker-compose exec backend pytest', 'marta-3': 'docker-compose exec backend pytest' }

function! RunTest(commands, reuse)
    let l:winview = winsaveview()
    execute '?def test'
    normal w

    let l:project = GetProjectName()

    if a:reuse
        let command = a:commands[l:project] . ' --reuse-db' . ' ' . expand('%') . ' -k ' . expand('<cword>')
    else
        let command = a:commands[l:project] . ' --create-db' . ' ' . expand('%') . ' -k ' . expand('<cword>')
    endif

    call winrestview(l:winview)
    execute 'nohlsearch'
    execute RunCommand(command)
    call winrestview(l:winview)
endfunction

function! RunTestFile(commands, reuse)
    let l:project = GetProjectName()

    if a:reuse
        execute RunCommand(a:commands[l:project] . ' --reuse-db' . ' ' . expand('%'))
    else
        execute RunCommand(a:commands[l:project] . ' --create-db' . ' ' . expand('%'))
    endif
endfunction

function! RunCommand(command)
    normal m'
    if exists(":VimuxRunCommand")
        execute VimuxRunCommand(a:command)
    else
        execute '!' . ' ' . a:command
    endif
endfunction

function! GetProjectName()
    let l:directory = execute('pwd')
    return split(l:directory, "/")[-1]
endfunction

map <leader>T :call RunTestFile(g:Commands, 1)<CR>
map <leader>TT :call RunTestFile(g:Commands, 0)<CR>
map <leader>t :call RunTest(g:Commands, 1)<CR>
map <leader>tt :call RunTest(g:Commands, 0)<CR>
" end of fast test runner
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" neomake settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:one_lte_path =  '/home/mslawins/marta-3/'

function! PylintArgs()
    let l:filepath = expand('%:p')
    let l:relative_path = substitute(l:filepath, g:one_lte_path, '', '')
    return ['exec', 'backend', 'pylint', '--output-format=text', '--rcfile=pylint.cfg', '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"', '--reports=n',  l:relative_path]
endfunction

autocmd FileType qf nnoremap <buffer> <Enter> <Enter>

call neomake#configure#automake('rw')
let g:neomake_place_signs = 0
let g:neomake_python_enabled_makers = ['agipylint']
let g:neomake_enabled_makers = ['agipylint']
let g:neomake_python_agipylint_maker = {
        \ 'args': funcref('PylintArgs'),
        \ 'exe': 'docker-compose',
        \ 'errorformat':
            \ '%A%f:%l:%c:%t: %m,' .
            \ '%A%f:%l: %m,' .
            \ '%A%f:(%l): %m,' .
            \ '%-Z%p^%.%#,' .
            \ '%-G%.%#',
        \ 'output_stream': 'stdout',
        \ 'cwd': g:one_lte_path,
        \ 'append_file': '0',
        \ 'postprocess': [
        \   function('neomake#postprocess#GenericLengthPostprocess'),
        \   function('neomake#makers#ft#python#PylintEntryProcess'),
        \ ]}

let g:neomake_agipylint_maker = {
        \ 'args': ['exec', 'backend', 'pylint', '--output-format=text', '--rcfile=pylint.cfg', '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"', '--reports=n',  g:one_lte_path . 'src/apps/'],
        \ 'exe': 'docker-compose',
        \ 'errorformat':
            \ '%A%f:%l:%c:%t: %m,' .
            \ '%A%f:%l: %m,' .
            \ '%A%f:(%l): %m,' .
            \ '%-Z%p^%.%#,' .
            \ '%-G%.%#',
        \ 'output_stream': 'stdout',
        \ 'cwd': g:one_lte_path,
        \ 'append_file': '0',
        \ 'postprocess': [
        \   function('neomake#postprocess#GenericLengthPostprocess'),
        \   function('neomake#makers#ft#python#PylintEntryProcess'),
        \ ]}
" end of neomake settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""