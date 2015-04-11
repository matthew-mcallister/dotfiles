" show line numbers
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

" GNUplot
au BufRead,BufNewFile *.plt setfiletype gnuplot

