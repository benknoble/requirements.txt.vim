" the Requirements File Format syntax support for Vim
" Version: 2.0.0
" Author:  raimon <raimon49@hotmail.com>
" Modifications: benknoble <ben.knoble@gmail.com>

" Refer https://github.com/vim/vim/blob/75e27d78f5370e7d2e0898326d9b080937e7b090/runtime/scripts.vim#L33-L71
"
" When a file's shebang is "pip install -r" or "pip-compile",
" set its filetype to |requirements|.
function! requirements#shebang() abort
  let s:line1 = getline(1)

  if s:line1 =~# "^#!"
    if s:line1 =~# '^#!\s*\S*\<env\s'
      let s:line1 = substitute(s:line1, '\S\+=\S\+', '', 'g')
      let s:line1 = substitute(s:line1, '\(-[iS]\|--ignore-environment\|--split-string\)', '', '')
      let s:line1 = substitute(s:line1, '\<env\s\+', '', '')
    endif
    if s:line1 =~# '^#!\s*\a:[/\\]'
      let s:name = substitute(s:line1, '^#!.*[/\\]\(\i\+\).*', '\1', '')
    elseif s:line1 =~# '^#!.*\<env\>'
      let s:name = substitute(s:line1, '^#!.*\<env\>\s\+\(\i\+\).*', '\1', '')
    elseif s:line1 =~# '^#!\s*[^/\\ ]*\>\([^/\\]\|$\)'
      let s:name = substitute(s:line1, '^#!\s*\([^/\\ ]*\>\).*', '\1', '')
    else
      let s:name = substitute(s:line1, '^#!\s*\S*[/\\]\(\i\+\).*', '\1', '')
    endif
    if s:name =~# '^pip'
      set filetype=requirements
    endif
  endif
endfunction

let s:unmatchable = '\w\b\w'

function! requirements#is_requirements_file()
  let l:filename = expand("%:p")
  return requirements#matched_filename(l:filename)
endfunction

function! requirements#matched_filename(filename)
  let l:pattern = get(g:, 'requirements#detect_filename_pattern', s:unmatchable)
  if a:filename =~# '\v.*require(ment)?s\.(txt|in)$'
    return 1
  elseif a:filename =~# '\vrequire(ment)?s/.*\.(txt|in)$'
    return 1
  elseif a:filename =~# '\vconstraints\.(txt|in)$'
    return 1
  elseif a:filename =~# l:pattern
    return 1
  endif
  return 0
endfunction
