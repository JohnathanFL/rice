
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('rust-lang/rust.vim')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('vim-scripts/mru.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('dense-analysis/ale')
  call dein#add('maxbrunsfeld/vim-yankstack')

  call dein#end()
  call dein#save_state()
endif

call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

filetype plugin indent on
syntax enable
set nu
set wildmenu
set nomodeline
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

let g:ale_linters = {'rust': ['rls']}


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='hybridline'
