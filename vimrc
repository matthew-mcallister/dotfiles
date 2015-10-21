set number
set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noswapfile
set expandtab
set textwidth=79

nnoremap <Leader>r :set relativenumber!<cr>

" I switch between 72 and 79 textwidth often
" <Leader>c swaps between 72 and 79 textwidth
" [count]<Leader>c sets the textwidth exactly
function AdjustTextwidth(count)
    if a:count is 0
        if &textwidth is 79
            let &textwidth=72
        else
            let &textwidth=79
        endif
    else
        let &textwidth=a:count
    endif
endfunction
nnoremap <Leader>c :<C-U>call AdjustTextwidth(v:count)<cr>

execute pathogen#infect()

