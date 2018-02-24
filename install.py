import os
from pathlib import Path

os.chdir(Path.home())

print('Setting vimrc')
with open('.vimrc', 'w') as file:
    file.write('source ~/Dropbox/configs/vim/vimrc.vim')

print('Setting tmux.conf')
with open('.vimrc', 'w') as file:
    file.write('source ~/Dropbox/configs/tmux/tmux.conf'

