set number
set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noswapfile
set viminfo=
set textwidth=79
set nojoinspaces
set noexpandtab

colorscheme slate

nnoremap <Leader>r :set relativenumber! <bar> :set number!<cr>
nnoremap <Leader>p :set paste!<cr>
nnoremap <Leader>s :syntax sync fromstart<cr>

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

" Global syntastic settings
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 0

let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": ["rust"] }

" No out-of-the-box python 3 support :(
let g:syntastic_python_checkers = []
let g:syntastic_rust_checkers = ["cargo"]

nnoremap <Leader>m :SyntasticToggleMode<cr>
