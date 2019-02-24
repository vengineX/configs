call plug#begin()
" Color Schemes
Plug 'smallwat3r/vim-mono_sw'
Plug 'LuRsT/austere.vim'
Plug 'smallwat3r/vim-hashpunk-sw'
Plug 'beikome/cosme.vim'
Plug 'maksimr/Lucius2'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'semibran/vim-colors-synthetic'
Plug 'fcpg/vim-orbital'
Plug 'wesgibbs/vim-irblack'
Plug 'neutaaaaan/monosvkem'
Plug 'vim-scripts/Gummybears'
Plug 'treycucco/vim-monotonic'
Plug 'wolf-dog/nighted.vim'
Plug 'andreypopp/vim-colors-plain'

" File Management & Search
Plug 'kien/ctrlp.vim'

" Folding & Viewability
Plug 'tmhedberg/SimpylFold'

" Indentation
Plug 'vim-scripts/indentpython.vim'

" Status 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
call plug#end()



" Syntax Highlighting
syntax on
let python_highlight_all=1



" Line Numbering
set nu

" vim-airline settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'orbital'

" Color Scheme
if has('gui_running')
	set background=dark
	colorscheme hashpunk-sw
else
	colorscheme hashpunk-sw
endif

" ctrlp: Fuzzy Finder
"	> Open file menu
nnoremap <Leader>o :CtrlP<CR>
" 	> Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" 	> Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

"------------------------------
" netrw: File Exporation
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

let g:netrw_browse_split = 4
let g:netrw_altv = 1

set autochdir

" Multiline Visual Feedback 
"   : ctrl+v + Shift+{I,A} + F12  
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

