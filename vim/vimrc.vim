" auto install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'morhetz/gruvbox' " retro coloring
Plug 'bling/vim-airline' " upper/lower bar
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy files explorer
Plug 'junegunn/fzf.vim' " fzf binding to vim
Plug 'Valloric/MatchTagAlways' " colors matching tags in html
Plug 'JamshedVesuna/vim-markdown-preview' " runs web browser in paraller with copiled markdown
Plug 'sheerun/vim-polyglot' " syntax for different languages
Plug 'mattn/emmet-vim' " emmet in vim
Plug 'hail2u/vim-css3-syntax' " better css3 syntax
Plug 'scrooloose/nerdcommenter' " fast code comment
Plug 'chrisbra/Colorizer' " colors coloring in css
Plug 'Valloric/YouCompleteMe', { 'do': './install.py'  } " code completition
Plug 'w0rp/ale' " async linter, for fixing requies prettier installed globally
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'jiangmiao/auto-pairs' " auto pair brackets etc.
Plug 'Shougo/neosnippet.vim' " snippet engine

call plug#end()

" add ftplugins to runtimepath
set runtimepath+=~/configs/vim/ftplugin

" editor options
source ~/configs/vim/editor.vim

" plugins options
source ~/configs/vim/plugins.vim

" remaps
source ~/configs/vim/remaps.vim

source ~/configs/vim/mac.vim
source ~/configs/vim/work.vim
