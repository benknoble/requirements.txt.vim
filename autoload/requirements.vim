" the Requirements File Format syntax support for Vim
" Version: 2.0.0
" Author:  raimon <raimon49@hotmail.com>
" Modifications: benknoble <ben.knoble@gmail.com>

let g:requirements#detect_filename_pattern =
      \ get(g:, 'requirements#detect_filename_pattern', '')

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
