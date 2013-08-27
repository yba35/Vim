
"""""""""""""""""""""""""""""""""""""""""""""
" EDSI-compatible coding rules for C language
"
" Author: Yann Bajot
" Last Update: 26-01-2007
"""""""""""""""""""""""""""""""""""""""""""""

"
" Indentation
"   * 2 spaces
"   * no tabs (expanded)
"
setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal smartindent " Also possible to use cindent; see Vim manual

"
" Line size = 80 caracters
"
setlocal textwidth=80

"
" Formatting options
"   How Vim automatically formats text
"
setlocal formatoptions=tcrql

"
" Copyright
"   Must be inserted at the beginning of each file
"
let s:date = strftime("%Y")
let s:EDSICopyrightTag = "/****************************************************************************\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " * Copyright (c) ". s:date . " - EDSI \<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . "*****************************************************************************/\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . "/*!\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *  \\brief  Description\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *  All other information about this file\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *  \\author FirstName LAST_NAME\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *  \\date   YYYY/MM/DD\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *  \\file\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *****************************************************************************/\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . "/* $Id$\<enter>"
let s:EDSICopyrightTag = s:EDSICopyrightTag . " *****************************************************************************/\<enter>"
























function! <SID>EDSICopyrightFunc()
  set paste
  exec "normal O" . s:EDSICopyrightTag
  set nopaste
endfunction

command! -nargs=0 EDSICopyright :call <SID>EDSICopyrightFunc()

