" e.g. :Tfdoc aws_instance
"      :Tfdoc -d aws_instance
if executable('tfdoc')  
    command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)
endif  

nnoremap <silent> <Leader>tfr :Tfdoc <C-R><C-W><CR>  
nnoremap <silent> <Leader>tfd :Tfdoc -d <C-R><C-W><CR>  
xnoremap <silent> <Leader>tfr y:Tfdoc <C-R>"<CR>  
xnoremap <silent> <Leader>tfd y:Tfdoc -d <C-R>"<CR>  

if executable('terraform')
    setlocal makeprg=terraform\ fmt\ -check\ -no-color\ -write=false\ %
    " setlocal errorformat=%EError:\ %m,%C,%C\ \ on\ %f\ line\ %l:,%Z%m
endif
