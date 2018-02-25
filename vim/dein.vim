" switches off vi compatibility
if &compatible
  set nocompatible
endif

" adds dein itself to runtime path
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" dein magic
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  " plugins
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim') " dein itself
  call dein#add('morhetz/gruvbox') " retro coloring
  call dein#add('bling/vim-airline') " upper/lower bar
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) " fuzzy files explorer
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf'  })
  call dein#add('Valloric/MatchTagAlways') " colors matching tags in html
  call dein#add('JamshedVesuna/vim-markdown-preview') " runs web browser in paraller with copiled markdown
  call dein#add('sheerun/vim-polyglot') " syntax for different languages
  call dein#add('Quramy/vim-js-pretty-template') " highlights es6 backtick strings templates
  call dein#add('mattn/emmet-vim') " emmet in vim
  call dein#add('hail2u/vim-css3-syntax') " better css3 syntax
  call dein#add('scrooloose/nerdcommenter') " fast code comment
  call dein#add('chrisbra/Colorizer') " colors coloring in css
  call dein#add('Valloric/YouCompleteMe') " code completition
  call dein#add('neomake/neomake') " async pylint checks
  call dein#add('tpope/vim-fugitive') " git wrapper
  call dein#add('jiangmiao/auto-pairs') " auto pair brackets etc.

  " work
  call dein#add('benmills/vimux') " used by aginoodle fast test runner

  " end of plugins

  call dein#end()
  call dein#save_state()
endif

" this options are set here as a duplicate to other file,
" because dein strictly requires them, it is better to have
" duplicate here than be sorry
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
