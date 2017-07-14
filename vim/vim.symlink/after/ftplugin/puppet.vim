" Puppet

func! PuppetParserValidate()
    let mp = &makeprg
    let ef = &errorformat
    let &makeprg = 'puppet parser validate --color=false'
    let &efm='%A%t%*[a-zA-Z]: %m at %f:%l'
    silent make %
    "copen
    cwindow "opens only if error. Needs a redraw
    redraw!
    let &makeprg     = mp
    let &errorformat = ef
endfunc

map <F5> :call PuppetParserValidate()<CR>
map <F6> :!puppet-lint validate %<CR>
