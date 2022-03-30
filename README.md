requirements.txt.vim
====================

[the Requirements File Format](https://pip.pypa.io/en/stable/reference/requirements-file-format/) syntax support for Vim.

![requirements txt-sc](https://cloud.githubusercontent.com/assets/221802/11379923/5cbb4862-9336-11e5-8963-217b2d7df397.png)

Table of Contents
-----------------

* [Installation](#installation)
    * [Plugin manager](#plugin-manager-recommended)
    * [Pathogen](#pathogen-httpsgithubcomtpopevim-pathogen)
    * [Manually](#manually)
* [File detection](#file-detection)
    * [Customize](#customize)
* [License](#license)

Installation
------------

### Plugin manager (**recommended**)

e.g. [vim-plug](https://github.com/junegunn/vim-plug), [dein.vim](https://github.com/Shougo/dein.vim), [NeoBundle](https://github.com/Shougo/neobundle.vim), [Vundle](https://github.com/VundleVim/Vundle.vim) [and more](https://dotfiles.github.io/)

```vim
" vim-plug
Plug 'benknoble/requirements.txt.vim'

" vim-plug with on-demand
Plug 'benknoble/requirements.txt.vim', {'for': 'requirements'}

" dein.vim
call dein#add('benknoble/requirements.txt.vim')

" dein.vim with lazy
call dein#add('benknoble/requirements.txt.vim', {'lazy': 1, 'on_ft': 'requirements'})

" NeoBundle
NeoBundle 'benknoble/requirements.txt.vim'

" Vundle
Plugin 'benknoble/requirements.txt.vim'
```

### Pathogen (https://github.com/tpope/vim-pathogen)

```sh
$ git clone https://github.com/benknoble/requirements.txt.vim.git ~/.vim/bundle/requirements.txt.vim
```

### Manually

Deploy all files under `$VIMRUNTIME`.

File detection
--------------

`requirements.txt.vim` detects filename automatically.

* `requirements.txt`
* `constraints.txt`
* `dev-requirements.txt`
* `requirements/dev.txt`
* `requires/tests.txt`
* `requirements.in`
    * Use for [pip-tools](https://github.com/jazzband/pip-tools) (a.k.a. Better dependency management tool).
* `*.pip`

### Customize

If you want to customize it.

```vim
" Add 'freeze' to your .vimrc as a detection pattern
let g:requirements#detect_filename_pattern = 'freeze'
```

```sh
$ pip freeze > my-freeze.txt
# You can edit it as a 'Requirements File Format'
$ vim my-freeze.txt
```

License
-------

[MIT License](LICENSE.txt)
