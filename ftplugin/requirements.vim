if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpoptions = &cpoptions
set cpoptions&vim

" pip options contain "-"
setlocal iskeyword+=-
setlocal commentstring=#\ %s
compiler pip_compile

let b:undo_ftplugin = 'setlocal iskeyword< commentstring<'

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
