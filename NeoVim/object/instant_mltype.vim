": multiline editing feedback
nmap <buffer> <silent> <expr> <F12> InsertCol()
imap <buffer> <silent> <expr> <F12> InsertCol()

function! InsertCol()
    let w:first_call = exists('w:first_call') ? 0 : 1
    "if w:first_call
    "    startinsert
    "endif
    try
        let char = getchar()
    catch /^Vim:Interrupt$/
        let char = "\<Esc>"
    endtry
    if char == '^\d\+$' || type(char) == 0
        let char = nr2char(char)
    endif " It is the ascii code.
    if char == "\<Esc>"
        unlet w:first_call
        return char
    endif
    redraw
    if w:first_call
        return char."\<Esc>gvA\<C-R>=Redraw()\<CR>\<F12>"
    else
        return char."\<Esc>gvlA\<C-R>=Redraw()\<CR>\<F12>"
    endif
endfunction

function! Redraw()
    redraw
    return ''
endfunction
