set textwidth=72

nmap <Leader>ll :!pdflatex %<CR>
nmap <Leader>lv :execute "!evince" expand("%:t:r") . ".pdf &"<CR><CR>

filetype plugin indent off
set autoindent
