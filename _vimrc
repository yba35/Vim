set nocompatible
set history=1000

"Commande Yann

"------------------------------------------------------------------------------
"  Look 
"------------------------------------------------------------------------------

" Light text on a dark background is easier on my eyes
highlight Normal ctermfg=white ctermbg=black guifg=white guibg=black

" Background must be set before syntax on to have an effect
set background=dark
syntax enable
syntax on

" We want text-types to show up in the same colours across all languages
" and filetypes.
hi Comment ctermfg=darkgrey guifg=darkgrey
hi Constant ctermfg=magenta guifg=magenta
hi PreProc ctermfg=green guifg=green
hi Special ctermfg=red guifg=red
hi Statement ctermfg=yellow guifg=yellow
hi Todo ctermfg=white ctermbg=red guifg=white guibg=red
hi Type ctermfg=yellow guifg=yellow

se visualbell

" text width = 0 => no automatic wrapping
se textwidth=0

" winwidth = 80
se winwidth=80

" set wildmenu
se wildmenu

" line numbers
se number

" wrap
se wrap

" backspace
se backspace=2

"set ruler
" Worst(ish) common case status line (ignoring filename):
" ChangeLog,+,#xx  xxh  ccc,llll of LLLL  99%
" which is 43 characters.
" Allow 15 chars for the filename, and left-justify it.
set statusline=%58(%-15t\ \ %Y%M\ \ #%n\ \ %Bh\ \ %v,%l\ of\ %L\ \ %P%)
set laststatus=2

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


" <F10> Rfind
map  <F10> :Rfind<CR>

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
 
" <F8>: search tags 
" :map <F8> :tselect  
" <F9>: NOT USED 
" <F10>: NOT USED 
" <F11>: NOT USED 
" <F12>: NOT USED 


" recherche definition dans le fichier et les include
map <Leader>d [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" ajout d'un commentaire TODO en fin de ligne
" map <Leader>td <Esc>A<Tab>// YBA - TODO: 

" edition du _vimrc
:map <Leader>v n:e $VIM/_vimrc<CR>
:map <Leader>s :source $VIM/_vimrc<CR>

"Commande LIP6
vnoremap / y/<C-R>"<CR>
vnoremap ? y?<C-R>"<CR>

vnoremap < <gv
vnoremap > >gv
vnoremap u ugv
vnoremap U Ugv
vnoremap ~ ~gv
vnoremap <C-Insert> "ay
nnoremap <C-Insert> "ay
nnoremap <S-Insert> "aP`[
nnoremap P P`[
nnoremap p p`[
inoremap <S-Insert> <C-R>a<C-O>`[

" Buffer navigation
:nmap <C-down> :BufExplorer<cr>
:nmap <C-S-left> :bnext<cr>
:nmap <C-S-right> :bprevious<cr>
:map <C-b> :buffer 

" tab navigation
:map <C-up> :tabnext<cr>

" windows navigation
nmap <C-Tab> <C-w>w
nmap <C-S-Tab> <C-w>W

" Paste from Windows clipboard
:map cc "*p


":nmap <C-S-left> :tabprevious<cr>
":nmap <C-S-right> :tabnext<cr>
":map <C-S-left> :tabprevious<cr>
":imap <C-S-left> <ESC>:tabprevious<cr>i
":imap <C-S-right> <ESC>:tabnext<cr>i
":nmap <C-t> :tabnew<cr>
":imap <C-t> <ESC>:tabnew<cr> 

"""""""""""""""""""""""""""""""""
""" Functions 
"""""""""""""""""""""""""""""""""

" To remove color escaped characters
"!function Y_escape_colors()
"  :%s/\[.\{-}m//g
"endfunction


"""""""""""""""""""""""""""""""""
""" Fold options 
"""""""""""""""""""""""""""""""""
:se foldmethod=indent
:se foldlevel=5
:se nofoldenable

"""""""""""""""""""""""""""""""""
""" Search options 
"""""""""""""""""""""""""""""""""
se hlsearch
se incsearch

"""""""""""""""""""""""""""""""""
""" Indent options 
"""""""""""""""""""""""""""""""""
:set tabstop=4
:set shiftwidth=2
:set softtabstop=2
:set expandtab
:set autoindent
:set smartindent
:inoremap # X#


"""""""""""""""""""""""""""""""""
""" Diff options 
"""""""""""""""""""""""""""""""""
:set diffopt=iwhite

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

" Grep.vim
:let Grep_Path = 'C:\cygwin\bin\grep.exe'
:let Grep_Find_Path = 'C:\cygwin\bin\find.exe'
:let Grep_Shell_Quote_Char = "'"
:let Grep_Default_Options = '-i'
:let Grep_Skip_Dirs = 'CVS .svn'
:let Grep_Cygwin_Find = 1

" svncommand.vim
let SVNCommandEnableBufferSetup=1
let SVNCommandCommitOnWrite=1
let SVNCommandEdit='edit'
let SVNCommandNameResultBuffers=1
let SVNCommandAutoSVK='svn'

" Project
let g:proj_flags='imstv' " 'v' means using internal grep

" VimSh
map <Leader>sh source $VIM/vimfiles/VimSh/vimsh.vim<CR>
let g:vimsh_sh= 'bash' " shell to run within vimsh

" vimExplorer
let VEConf_singleFileActions = {}
let VEConf_singleFileHotKeys = {}
let VEConf_singleFileHotKeys['test2'] = 'o'
function! VEConf_singleFileActions['test2'](path)
    exe ':tabn'
    exe ':edit ' . a:path 
endfunction

" vimwiki
let g:vimwiki_list = [{'path': '$VIM/'}]




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Enhanced Commentify 
:let g:EnhCommentifyRespectIndent = 'Yes'
:let g:EnhCommentifyPretty = 'Yes'

" Grep program
se grepprg=grep\ -n

" 'make' options 
se makeprg=make
se shellpipe=&> 

" Show Match
se showmatch



" Enable ftplugin to be loaded
:filetype plugin on



"""""""""""""""""""""""""""""""""
""" Commandes utiles 
"""""""""""""""""""""""""""""""""


""""" Pour virer les 'escaped characters' de couleurs
" pour afficher le caractere spéciual: CTRL_V puis CTRL+ALTGR+[
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
"  Rfind 
"------------------------------------------------------------------------------

" RunFindRecursive()
" Run specified find command recursively
function! s:RunFindRecursive(cmd_name, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . "[<file_name(s)>]]"
        return
    endif

    let grep_opt    = ""
    let filepattern = ""

    let argcnt = 1
    while argcnt <= a:0
        if a:{argcnt} =~ '^-'
            let grep_opt = grep_opt . " " . a:{argcnt}
        else
            let filepattern = filepattern . " " . a:{argcnt}
        endif
        let argcnt= argcnt + 1
    endwhile

    let cwd = getcwd()
    if g:Grep_Cygwin_Find == 1
        let cwd = substitute(cwd, "\\", "/", "g")
    endif
    if v:version >= 700
        let startdir = input("Start searching from directory: ", cwd, "dir")
    else
        let startdir = input("Start searching from directory: ", cwd)
    endif
    if startdir == ""
        return
    endif

    if filepattern == ""
        let filepattern = input("Search in files matching pattern: ", 
                                          \ g:Grep_Default_Filelist)
        if filepattern == ""
            return
        endif
    endif
    echo "\n"

    let txt = filepattern . ' '
    let find_file_pattern = ''
    while txt != ''
        let one_pattern = strpart(txt, 0, stridx(txt, ' '))
        if find_file_pattern != ''
            let find_file_pattern = find_file_pattern . ' -o'
        endif
        let find_file_pattern = find_file_pattern . ' -name ' .
              \ g:Grep_Shell_Quote_Char . one_pattern . g:Grep_Shell_Quote_Char
        let txt = strpart(txt, stridx(txt, ' ') + 1)
    endwhile
    let find_file_pattern = g:Grep_Shell_Escape_Char . '(' .
                    \ find_file_pattern . ' ' . g:Grep_Shell_Escape_Char . ')'

    let txt = g:Grep_Skip_Dirs
    let find_prune = ''
    if txt != ''
        let txt = txt . ' '
        while txt != ''
            let one_dir = strpart(txt, 0, stridx(txt, ' '))
            if find_prune != ''
                let find_prune = find_prune . ' -o'
            endif
            let find_prune = find_prune . ' -name ' . one_dir
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
        let find_prune = '-type d ' . g:Grep_Shell_Escape_Char . '(' .
                         \ find_prune
        let find_prune = find_prune . ' ' . g:Grep_Shell_Escape_Char . ')'
    endif

    let txt = g:Grep_Skip_Files
    let find_skip_files = '-type f'
    if txt != ''
        let txt = txt . ' '
        while txt != ''
            let one_file = strpart(txt, 0, stridx(txt, ' '))
            let find_skip_files = find_skip_files . ' ! -name ' .
                                  \ g:Grep_Shell_Quote_Char . one_file .
                                  \ g:Grep_Shell_Quote_Char
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
    endif

    let cmd = g:Grep_Find_Path . " " . startdir
    let cmd = cmd . " " . find_prune . " -prune -o"
    let cmd = cmd . " " . find_skip_files
    let cmd = cmd . " " . find_file_pattern
    let cmd = cmd . " -printf '%p\\n'"

    call s:RunFindCmd(cmd, filepattern)
endfunction

command! -nargs=* -complete=file Rfind
            \ call s:RunFindRecursive('Rfind', <f-args>)

" RunFindCmd()
" Run the specified grep command using the supplied pattern
function! s:RunFindCmd(cmd, pattern)
    let cmd_output = system(a:cmd)

    if cmd_output == ""
        echohl WarningMsg | 
        \ echomsg "Error: Pattern " . a:pattern . " not found" | 
        \ echohl None
        return
    endif

    let tmpfile = tempname()

    let old_verbose = &verbose
    set verbose&vim

    exe "redir! > " . tmpfile
    silent echon '[Search results for pattern: ' . a:pattern . "]\n"
    silent echon cmd_output
    redir END

    let &verbose = old_verbose

    let old_efm = &efm
    set efm=%f

    if exists(":cgetfile")
        execute "silent! cgetfile " . tmpfile
    else
        execute "silent! cfile " . tmpfile
    endif

    let &efm = old_efm

    " Open the grep output window
    if g:Grep_OpenQuickfixWindow == 1
        " Open the quickfix window below the current window
        botright copen
    endif

    call delete(tmpfile)
endfunction


"------------------------------------------------------------------------------
"  Python Environement 
"------------------------------------------------------------------------------
"
" PyDoc
let g:pydocpath= "C:\\Python25\\Tools\\scripts\\pydoc"
" PyLint
let g:pylintpath= "C:\Python25\Scripts\pylint.bat"
" PyChecker
let g:pycheckerpath= "C:\Python25\Scripts\pychecker.bat"

""------------------------------------------------------------------------------
""  Python Fold (vimtips 741)
""------------------------------------------------------------------------------
"augroup python_prog
" au!
" fun! Python_fold()
"   execute 'syntax clear pythonStatement'
"   execute 'syntax keyword pythonStatement break continue del'
"   execute 'syntax keyword pythonStatement except exec finally'
"   execute 'syntax keyword pythonStatement pass print raise'
"   execute 'syntax keyword pythonStatement return try'
"   execute 'syntax keyword pythonStatement global assert'
"   execute 'syntax keyword pythonStatement lambda yield'
"   execute 'syntax match pythonStatement /\<def\>/ nextgroup=pythonFunction skipwhite'
"   execute 'syntax match pythonStatement /\<class\>/ nextgroup=pythonFunction skipwhite'
"   execute 'syntax region pythonFold start="^\z(\s*\)\%(class\|def\)" end="^\%(\n*\z1\s\)\@!" transparent fold'
"   execute 'syntax sync minlines=2000 maxlines=4000'
"   set autoindent
"   set foldmethod=syntax
"   " set foldopen=all foldclose=all
"   set foldtext=substitute(getline(v:foldstart),'\\t','\ \ \ \ ','g')
"   set fillchars=vert:\|,fold:\ 
"   set tabstop=4 shiftwidth=4 nowrap guioptions+=b
" endfun
" autocmd FileType python call Python_fold()
"augroup END

"------------------------------------------------------------------------------
"  Pylint and Pychecker support (vimtips 949)
"------------------------------------------------------------------------------

"autocmd FileType python compiler pylint

"function PythonGrep(tool)
"  set lazyredraw
"  " Close any existing cwindows.
"  cclose
"  let l:grepformat_save = &grepformat
"  let l:grepprogram_save = &grepprg
"  set grepformat&vim
"  set grepformat&vim
"  let &grepformat = '%f:%l:%m'
"  if a:tool == "pylint"
"      let &grepprg = 'pylint.bat --parseable=y --reports=n'
"  elseif a:tool == "pychecker"
"      let &grepprg = 'pychecker.bat --quiet -q'
"  else
"      echohl WarningMsg
"      echo "PythonGrep Error: Unknown Tool"
"      echohl none
"  endif
"  if &readonly == 0 | update | endif
"  silent! grep! %
"  let &grepformat = l:grepformat_save
"  let &grepprg = l:grepprogram_save
"  let l:mod_total = 0
"  let l:win_count = 1
"  " Determine correct window height
"  windo let l:win_count =  l:win_count + 1
"  if l:win_count <= 2 | let l:win_count = 4 | endif
"  windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
"  \ execute 'resize +'.l:mod_total
"  " Open cwindow
"  execute 'belowright copen '.l:mod_total
"  nnoremap <buffer> <silent> c :cclose<CR>
"  set nolazyredraw
"  redraw!
"endfunction

"if ( !hasmapto('<SID>PythonGrep(pylint)') && (maparg('<F8>') == '') )
"    map  <F8> :call <SID>PythonGrep('pylint')<CR>
"    map! <F8> :call <SID>PythonGrep('pylint')<CR>
"else
"    if ( !has("gui_running") || has("win32") )
"        echo "Python Pylint Error: No Key mapped.\n".
"        \  "<F8> is taken and a replacement was not assigned."
"    endif
"endif
"
"if ( !hasmapto('<SID>PythonGrep(pychecker)') && (maparg('<F9>') == '') )
"    map  <F9> :call <SID>PythonGrep('pychecker')<CR>
"    map! <F9> :call <SID>PythonGrep('pychecker')<CR>
"else
"    if ( !has("gui_running") || has("win32") )
"        echo "Python Pychecker Error: No Key mapped.\n".
"        \  "<F9> is taken and a replacement was not assigned."
"    endif
"endif



