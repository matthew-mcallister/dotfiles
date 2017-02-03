nmap <Leader>ll :!pdflatex -interaction=nonstopmode -halt-on-error %<CR>
nmap <Leader>lv :execute "!evince" expand("%:t:r") . ".pdf &"<CR><CR>

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

filetype plugin indent off
set autoindent
