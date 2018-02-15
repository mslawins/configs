" PACKAGE INSTALL: call dein#install()

" switches off vi compatibility
if &compatible
  set nocompatible
endif

" adds dein itself to runtime path
set runtimepath+=~/Dropbox/configs/vim/plugins/repos/github.com/Shougo/dein.vim

" dein magic
if dein#load_state('~/Dropbox/configs/vim/plugins')
  call dein#begin('~/Dropbox/configs/vim/plugins')

  " plugins 
  call dein#add('~/Dropbox/configs/vim/plugins/repos/github.com/Shougo/dein.vim') " dein itself
  call dein#add('morhetz/gruvbox') " reto coloring

  " end of plugins

  call dein#end()
  call dein#save_state()
endif

" this options are set here as a duplicate to other files,
" because dein strictly requires them, it is better to have
" duplicate here than be sorry
filetype plugin indent on
syntax enable
