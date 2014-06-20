set nocompatible              " be iMproved, required
filetype off                  " required


"------------------------------------------------------------------------------
"  Vundle setting
"------------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------
"  Additional bundles
"------------------------------------------------------------------------------
Bundle 'bufexplorer.zip'
Bundle 'Align'
Bundle 'vimwiki'
Bundle 'bash-support.vim'
Bundle 'a.vim'
Bundle 'systemverilog.vim'
Bundle 'SuperTab'


"------------------------------------------------------------------------------
"  Change some default value
"------------------------------------------------------------------------------
set nocursorline
color darkblue
set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
syntax enable

if has('clipboard')
    if has('unnamedplus') " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

"------------------------------------------------------------------------------
"  Misc
"------------------------------------------------------------------------------
se visualbell
set history=1000

set backspace=indent,eol,start  " Backspace for dummies

"------------------------------------------------------------------------------
"  Text formatting
"------------------------------------------------------------------------------
" text width = 0 => no automatic wrapping
se textwidth=0

" wrap
se wrap

:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set expandtab
":set autoindent
":set smartindent
":inoremap # X#


"------------------------------------------------------------------------------
"  Key Mappings
"------------------------------------------------------------------------------

" map leader
:let mapleader=','

" <F2>: Save current file
:map <F2> :w!<CR>
:imap <F2> <ESC>:w!<CR>

" <S-F2>: Save current session
":map <S-F2> :mksession! ~/last_vim_session.vim<CR>
:set sessionoptions=buffers,curdir
:map <S-F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so $VIM/vimfiles/sessions/

" <F3>: Split Vertically
map  <F3> n:e
map! <F3> <ESC>n:e

" <F4>: Split Horizontally
map  <F4> v:e
map! <F4> <ESC>v:e

" <F8>: Copy word under cursor
map  <F8> yiw
imap <ESC><F8> yiw

" <F9>: Copy selection into clipboard
vmap <F9> "*y

" <S-F9>: Paste from clipboard
map <S-F9> "*p

" <F6>: previous list error 
" <F7>: next list error
map  <F6> :colder<CR>
map  <F7> :cnewer<CR>

" <S-F6>: previous error 
" <S-F7>: next error
:map <S-F6> :cprev<CR> 
:imap <S-F6> <ESC>:cprev<CR> 
:map <S-F7> :cnext<CR> 
:imap <S-F7> <ESC>:cnext<CR> 

" edition du _vimrc
:map <Leader>v n:e $VIM/.vimrc.local<CR>
:map <Leader>s :source $VIM/.vimrc.local<CR>

" Buffer navigation
:nmap <C-down> :BufExplorer<cr>
:nmap <C-S-left> :bnext<cr>
:nmap <C-S-right> :bprevious<cr>
:map <C-b> :buffer 


"""""""""""""""""""""""""""""""""
""" Case options
"""""""""""""""""""""""""""""""""
" ignorecase sauf pour les recherches
se smartcase
se ignorecase


"""""""""""""""""""""""""""""""""
""" Plug-ins
"""""""""""""""""""""""""""""""""
" Buffer Explorer
:let g:bufExplorerSplitType='v'       " Split vertically.

" vimwiki
let g:vimwiki_list = [{'path': '$HOME/.spf13-vim-3/vimwiki'}]

"""""""""""""""""""""""""""""""""
""" Commandes utiles 
"""""""""""""""""""""""""""""""""


""""" Pour virer les 'escaped characters' de couleurs
" pour afficher le caractere spÃ©ciual: CTRL_V puis CTRL+ALTGR+[
" :%s/\[[0-9]\{-}m//g

"------------------------------------------------------------------------------
"  Tag search 
"------------------------------------------------------------------------------
function! SelectTag()
  let curWord=expand("<cword>")
  execute "tjump " curWord
endfunction

map <F8> :call SelectTag()<CR>


"------------------------------------------------------------------------------
"  SmartCase function
"------------------------------------------------------------------------------
function! SmartCase(replace)
let s:found=submatch(0)
if s:found ==# tolower(s:found)
  return tolower(a:replace)
elseif s:found ==# toupper(s:found)
  return toupper(a:replace)
else
  return a:replace
endif
endfunction

function! Essai_f(replace)
  return submatch(0).a:replace 
endfunction

command! -nargs=* Essai call Essai_f(<f-args>)



"------------------------------------------------------------------------------
"  Commented - deprecated
"------------------------------------------------------------------------------
"Commande LIP6
"vnoremap / y/<C-R><CR>
"vnoremap ? y?<C-R><CR>

"vnoremap < <gv
"vnoremap > >gv
"vnoremap u ugv
"vnoremap U Ugv
"vnoremap ~ ~gv
"vnoremap <C-Insert> ay
"nnoremap <C-Insert> ay
"nnoremap <S-Insert> aP`[
"nnoremap P P`[
"nnoremap p p`[
"inoremap <S-Insert> <C-R>a<C-O>`[


":set diffopt=iwhite

