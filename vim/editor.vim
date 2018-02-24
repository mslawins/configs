filetype plugin indent on " allows to overwrite this settings for specific filetypes
set hidden " allows to open new buffer, when current one is unsaved
set mouse=a " allows mouse in all modes
set backspace=2 " backspace works in insert
set background=dark " prefer dark version

" editor
set number " shows line numbers
set cursorline " highlights current line
set colorcolumn=120 " highlight column

" coloring
syntax enable " allow syntax coloring
set t_Co=256 " allows 256 colors
" colorscheme set in plugins

" indent
set expandtab " tab now inserts spaces
set tabstop=4 " amount of spaces that one tab takes, ftplugin can overwrite
set shiftwidth=4  " indent size

" swap & backup files
set nobackup " does not create backup files
set noswapfile " does not create swap files

" splits
set splitbelow " open horizontal split below
set splitright " open vertical split on right side

" search
" ignorcase and smartcase together:
" lowercase matches lowercase and uppercase
" uppercase matches only uppercase
set ignorecase
set smartcase
set hlsearch " highlight all matches
set incsearch " incremental searching when typing

" preview
set completeopt-=preview " switches off preview screen

" speed up vim
set ttyfast " send more characters to redraw at a time
