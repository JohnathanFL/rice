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
  call dein#add('alvan/vim-closetag')

  call dein#end()
  call dein#save_state()
endif
set pyxversion=3

pythonx import pynvim
call deoplete#custom#option('sources', 
      \{ '_': ['buffer', 'ale'],
      \'rust': ['ale'],
      \'cpp': ['ale'],
      \'sh': ['ale'],
      \})
call deoplete#custom#option({ 'auto_complete_delay': 200, 'smart_case': v:true, 'ignore_case': v:true, })
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('omni_patterns', {
  \ 'java': '[^. *\t]\.\w*',
  \  'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
  \  'xhtml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
  \  'xml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
  \})
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


filetype plugin indent on
syntax enable
set nu
set wildmenu
set nomodeline
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
" Make it so we can use [qwe] to navigate by word
nnoremap q b

let g:ale_linters = {'rust': ['rls']}
set omnifunc=ale#completion#OmniFunc

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='hybridline'
let g:airline_theme='hybridline'
