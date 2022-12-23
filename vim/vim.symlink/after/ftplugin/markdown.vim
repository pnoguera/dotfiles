set colorcolumn=80
setlocal tw=80
set spell

" Create a Markdown-link structure for the current word or visual selection with
" leader 3. Paste in the URL later. Or use leader 4 to insert the current
" system clipboard as an URL.
nnoremap <Leader>l ciw[<C-r>"]()<Esc>
vnoremap <Leader>l c[<C-r>"]()<Esc>
nnoremap <Leader>k ciw[<C-r>"](<Esc>"*pli)<Esc>
vnoremap <Leader>k c[<C-r>"](<Esc>"*pli)<Esc>

nnoremap <Leader>v :vertical term mdcat %<Enter><C-w>L
