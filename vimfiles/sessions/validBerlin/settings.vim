"------------------------------------------------------------------------------ 
" VIM settings for BERLIN validation
"------------------------------------------------------------------------------ 
let g:BerlinValidationPath = 'T:\Projets\Berlin\DEV\VALID'
let g:BerlinPythonFileTemplate = 'T:\Projets\Berlin\DEV\TOOLS\COMMON\NEW_FILE\TEMPLATE\PC\Template.py'

"------------------------------------------------------------------------------ 
" Open Python Template 
"------------------------------------------------------------------------------ 
function! NewPythonFile()
  exe ':new '
  exe ':read '. g:BerlinPythonFileTemplate
  exe ':1 delete'
  exe ':%substitute/\~YEAR\~/\=strftime("%Y")/g'
  exe ':%substitute/\~COMPANY_NAME\~/EDSI/g'
  exe ':%substitute/\~AUTHOR\~/Yann BAJOT/g'
  exe ':%substitute/\~DATE\~/\=strftime("%Y-%m-%d")/g'
  exe ':set syntax=python'
endfunction

"------------------------------------------------------------------------------ 
" Search Python module 
"------------------------------------------------------------------------------ 
function! SearchPythonModule(name)
  exe ':lvimgrep /.*' . a:name . '.*/ ' g:BerlinValidationPath
endfunction
