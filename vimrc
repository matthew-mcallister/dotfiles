" Show line numbers
set number

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" keep tabs as tabs
set noexpandtab

" disable swap files
set noswapfile

execute pathogen#infect()
syntax on
filetype plugin indent on

" XML

au FileType xml set tabstop=4
au FileType xml set softtabstop=2
au FileType xml set shiftwidth=2
au FileType xml set expandtab
au FileType xml set shiftround

" Haskell

au FileType haskell set tabstop=8
au FileType haskell set expandtab
au FileType haskell set shiftround

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" GNUplot

au BufRead,BufNewFile *.plt setfiletype gnuplot

