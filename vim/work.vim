" fast test runner
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" usage:
" leader t - one test with current cursor position
" leader tt - one test with current cursor position, with clear database
" leader T - all tests in file
let g:Commands = {'one-lte-backlog': 'docker-compose exec backend pytest', 'aginoodle': 'docker-compose exec backend python ./tests.py --disable-pytest-warnings', 'marta-pro': 'docker-compose exec backend pytest', 'marta-3': 'docker-compose exec backend pytest' }

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
