nmap <C-B> <Plug>(go-doc-browser)
nmap <leader>gs <Plug>(go-doc-split)
nmap <F4> <Plug>(go-build)
nmap <F5> :<C-U>!go run %<CR>
nmap <F6> <Plug>(go-test)
nmap <leader>r <Plug>(go-run)
nmap <leader>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage)
nmap <leader>as <Plug>(go-alternate-split)
nmap <leader>av <Plug>(go-alternate-vertical)
nmap <leader>ae <Plug>(go-alternate-edit)
nmap <leader>at <Plug>(go-alternate-tab)
nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)
nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)
nmap <Leader>s <Plug>(go-implements)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>e <Plug>(go-rename)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Automatic go imports
let g:go_fmt_command = "goimports"

nmap <F8> :TagbarToggle<CR>

" Autocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
NeoCompleteEnable
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
 return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
