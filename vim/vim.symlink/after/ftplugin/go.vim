set number
set colorcolumn=80

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

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Use gopls
 let g:go_def_mode='gopls'
 let g:go_info_mode='gopls'
 let ale_linters = {'go': ['gopls'],}

" Highlight variables and others that are the same
let g:go_auto_sameids = 1

" Show type information in status line
let g:go_auto_type_info = 1

" Automatic go imports
let g:go_fmt_command = "goimports"

" conflict with ale
let g:go_fmt_fail_silently = 1

set noexpandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Autocomplete
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls'}
