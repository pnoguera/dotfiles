" disable gpls (used by vim-lsp)
let g:go_gopls_enabled = 1
" let g:go_gopls_options = ['-remote=auto']
let g:go_gopls_options = ['-remote=127.0.0.1:25000']

let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1

" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1

" Use gopls
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

" Highlight variables and others that are the same
let g:go_auto_sameids = 1

" Show type information in status line
let g:go_auto_type_info = 1

" Automatic go imports
let g:go_fmt_command = "goimports"

" conflict with ale
let g:go_fmt_fail_silently = 1
