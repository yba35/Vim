" Only do this when not done yet for this buffer
" 
"if exists("b:did_PYTHON_ftplugin")
"  finish
"endif
"let b:did_PYTHON_ftplugin = 1


"---------------------------
" Set Pylint as compiler
"---------------------------
"setlocal shell=cmd.exe
"setlocal makeprg=python\ toto.py\ %:.
"setlocal errorformat=%+P[%f],%t:\ %#%l:%m
"setlocal shellpipe=>

setlocal shell=cmd.exe
setlocal makeprg=\"(pylint\ -i\ y\ -f\ parseable\ %:p)"
setlocal errorformat=%f:%l:\ [%t%n]%m,%f:%l:\ [%t%n\\,\ %*\\S]%m
setlocal shellpipe=>

" map  <buffer> <F5> :make<CR>:copen<CR>
" map! <buffer> <F5> <ESC>:make<CR>:copen<CR>
map  <buffer> <F5> :make<CR>
map! <buffer> <F5> <ESC>:make<CR>


"---------------------------
" Folding 
"---------------------------
setlocal nofoldenable
map <Leader>r zMzx


"---------------------------
" Indentation 
"---------------------------
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
"setlocal autoindent " Already defined in $VIM/vimfiles/ident/python.vim
setlocal smartindent

"---------------------------
" TODO comment 
"---------------------------
ab td TODO-YBA:  

ab cei # end if
ab cef # end for
"---------------------------
" Check line width
"---------------------------
"exec 'match SpellLocal /\%>' .  &textwidth . 'v.\+/'


