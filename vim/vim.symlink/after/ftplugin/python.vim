set ai
set ts=4
set sw=4
set et

" For full syntax highlighting:
let python_highlight_all=1

command! Pyrun execute "!python3 %"
command! Intpyrun execute "!ipython3 -i %"

map <F4> :call Autopep8()<CR>
map <F5> :Pyrun<CR>
map <F6> :Intpyrun<CR>
