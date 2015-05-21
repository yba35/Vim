Vim
===

Vim configuration files

.vimrc contains all the needed configuration

Vundle need to be installed: https://github.com/gmarik/Vundle.vim

'vimiwiki' contains the vimwiki files - just edit the .vimrc.local file to adapt the  g:vimwiki_list variable

Installation (Windows)
----------------------
cd "$USERPROFILE"; git clone https://github.com/yba35/Vim.git vimconfig; ln vimconfig/.vimrc _vimrc

Installation (Linux)
----------------------
cd HOME; git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd $HOME; git clone https://github.com/yba35/Vim.git vimconfig; ln vimconfig/.vimrc .vimrc

Run vim and type :PuginInstall




