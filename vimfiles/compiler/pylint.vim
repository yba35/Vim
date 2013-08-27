"if exists("current_compiler")
"  finish
"endif
"let current_compiler = "pylint"

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet errorformat=%+P[%f],%t:\ %#%l:%m
"CompilerSet makeprg=(echo\ '[%]';\ pylint\ %:p)
CompilerSet makeprg=pylint\ %:p
CompilerSet shellpipe=>


