" Only do this when not done yet for this buffer
" 
"if exists("b:did_JOURNAL_ftplugin")
"  finish
"endif
"let b:did_JOURNAL_ftplugin = 1

setlocal autoread
setlocal nowrap
map <buffer> cc ggVG<DEL>

