nmap <Bslash>ll :!pdflatex %<CR>
nmap <Bslash>lv :execute "!evince" expand("%:t:r") . ".pdf &"<CR><CR>

" can't stand it
filetype plugin indent off

set autoindent
