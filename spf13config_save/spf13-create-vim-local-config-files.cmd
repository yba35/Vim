@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR=%HOME%\.spf13-vim-3

call mklink "%HOME%\.vimrc.local" "%BASE_DIR%\.vimrc.local"
call mklink "%HOME%\.gvimrc.local" "%BASE_DIR%\.gvimrc.local"
