" add ftplugins to runtimepath
set runtimepath+=~/Dropbox/configs/vim/ftplugin

" plugin manager
source ~/Dropbox/configs/vim/dein.vim

" editor options
source ~/Dropbox/configs/vim/editor.vim

" plugins options
source ~/Dropbox/configs/vim/plugins.vim

" remaps
source ~/Dropbox/configs/vim/remaps.vim

" system specific
if has('mac')
    source ~/Dropbox/configs/vim/mac.vim
elseif has('unix')
    source ~/Dropbox/configs/vim/unix.vim
endif
