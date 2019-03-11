set ai
set ts=4
set sw=4
set et

let TlistAutoOpen = 1

command! Pyrun execute "!python %"
command! Intpyrun execute "!python -i %"

map <F5> :Pyrun<CR>
map <F6> :Intpyrun<CR>
map <F7> :TaskList<CR>
nnoremap <silent> <F8> :TlistToggle<CR>

let g:SuperTabDefaultCompletionType = "context"

let g:pymode_python = 'python3'
