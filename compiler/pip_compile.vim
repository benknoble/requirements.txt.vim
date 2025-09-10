" the Requirements File Format syntax support for Vim
" Version: 2.0.0
" Author:  raimon <raimon49@hotmail.com>
" Modifications: benknoble <ben.knoble@gmail.com>

if exists('b:current_compiler')
    finish
endif
let b:current_compiler = 'pip_compile'

let s:save_cpoptions = &cpoptions
set cpoptions&vim

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet makeprg=pip-compile\ %:S
CompilerSet errorformat=%ECould\ not\ find\ a\ version\ that\ matches\ %o\ (from\ -r\ %f\ (line\ %l)),
            \%C%m,
            \%Z,
            \%-G%.%#

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
