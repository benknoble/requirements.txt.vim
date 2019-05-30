" the Requirements File Format syntax support for Vim
" Version: 2.0.0
" Author:  raimon <raimon49@hotmail.com>
" Modifications: benknoble <ben.knoble@gmail.com>

au BufNewFile,BufRead *.{txt,in}
      \ if requirements#is_requirements_file() |
      \   setfiletype requirements |
      \ endif
au BufNewFile,BufRead *.pip setfiletype requirements
