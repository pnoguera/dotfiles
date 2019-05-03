set ai
set ts=4
set sw=4
set et

let TlistAutoOpen = 1

let g:ale_linters = {
            \'python': ['flake8'] ,
            \}

command! Pyrun execute "!python %"
command! Intpyrun execute "!python -i %"

map <F4> :call Autopep8()<CR>
map <F5> :Pyrun<CR>
map <F6> :Intpyrun<CR>
map <F7> :TaskList<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>

set colorcolumn=80  " highlight column 80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
