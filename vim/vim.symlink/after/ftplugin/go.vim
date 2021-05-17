set number
set colorcolumn=80
set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4


nmap <C-B> <Plug>(go-doc-browser)
nmap <leader>gs <Plug>(go-doc-split)
nmap <F4> <Plug>(go-build)
nmap <F5> :<C-U>!go run %<CR>
nmap <F6> <Plug>(go-test)
nmap <leader>r <Plug>(go-run)
nmap <leader>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage)
nmap <leader>as <Plug>(go-alternate)
nmap <leader>as <Plug>(go-alternate-split)
nmap <leader>av <Plug>(go-alternate-vertical)
nmap <leader>ae <Plug>(go-alternate-edit)
nmap <leader>at <Plug>(go-alternate-tab)
nmap <Leader>d <Plug>(go-def)
nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)
nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)
nmap <Leader>s <Plug>(go-implements)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>e <Plug>(go-rename)
nmap <leader>gt :GoDeclsDir<cr>
nmap gr :LspReferences<cr>
