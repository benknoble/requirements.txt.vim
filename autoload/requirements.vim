" the Requirements File Format syntax support for Vim
" Version: 1.5.1
" Author:  raimon <raimon49@hotmail.com>
" License: MIT LICENSE
" The MIT License (MIT)
"
" Copyright (c) 2015 raimon
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

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
