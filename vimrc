set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set noswapfile

function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

nnoremap <Bslash>r :call NumberToggle()<cr>

execute pathogen#infect()

