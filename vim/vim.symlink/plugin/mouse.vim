" Toggle mouse
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=c
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc
nmap  <Leader>m :call ToggleMouse()<CR>

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    if !has('nvim')
        set ttymouse=xterm2
    endif
endif

