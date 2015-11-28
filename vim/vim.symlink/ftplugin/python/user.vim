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

"execute "nnoremap <silent> <buffer>K :call jedi#show_pydoc()<CR>"
let g:jedi#pydoc = "K"
let g:jedi#use_tabs_not_buffers = 0

let g:SuperTabDefaultCompletionType = "context"
