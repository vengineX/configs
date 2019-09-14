" vengent.io: lightweight init.vim
" URL: http://nvim.vengent.io
" --------------------------------------

" Auto-Install: Vim-Plug:
"   - Upon first run or if 'plug.vim' is non-existent.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter + PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged') 
" Auto-Install: Plugins:
"   - Upon finding missing plugins or first run.
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
 autocmd VimEnter * PlugInstall | q
endif

" Plugin List:
" --------------------------------------

":  Appearence
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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

":  Functionality
  Plug 'troydm/zoomwintab.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'c-brenn/phoenix.vim'
  Plug 'tpope/vim-projectionist'
  Plug 'tmhedberg/SimpylFold'
  Plug 'slashmili/alchemist.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'neomake/neomake', { 'on': 'Neomake' }
  Plug 'nvie/vim-flake8'
  
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

":  Development Languages
  Plug 'sheerun/vim-polyglot'
  Plug 'pangloss/vim-javascript'
  Plug 'carlitux/deoplete-ternjs'
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Quramy/tsuquyomi'
  Plug 'mhartington/deoplete-typescript'

call plug#end()

" Settings
" --------------------------------------

":  Appearence 
if has ('gui_running')
  set termguicolors
  set background=dark
  colorscheme hashpunk-sw
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
else
  set termguicolors
  colorscheme plain
endif 

":  Status Line
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_theme='cosme'

":  Functionality
  set number
  set hidden
  set mouse=a
  set noshowmode
  set noshowmatch
  set nolazyredraw

":  Backup & Recovery
  set nobackup
  set noswapfile
  set nowritebackup

":  Completion
  set omnifunc=syntaxcomplete#Complete

":  Formatting
  noremap <F3> :Autoformat<CR>
  
":  Indentation 
  set shiftwidth=2
  set softtabstop=2
  set expandtab

":  Plugins
  nnoremap <Leader>o :CtrlP<CR>
  nnoremap <Leader>b :CtrlPBuffer<CR>
  nnoremap <Leader>f :CtrlPMRUFiles<CR>
  
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_ignore_case = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#enable_camel_case = 1
  let g:deoplete#enable_refresh_always = 1
  let g:deoplete#max_abbr_width = 0
  let g:deoplete#max_menu_width = 0
  let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
  
  let g:tern_request_timeout = 1
  let g:tern_request_timeout = 6000
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
  let g:deoplete#sources#tss#javascript_support = 1
  let g:tsuquyomi_javascript_support = 1
  let g:tsuquyomi_auto_open = 1
  let g:tsuquyomi_disable_quickfix = 1
  
  autocmd! BufWritePost * Neomake
  let g:neomake_warning_sign = {
    \ 'text': '?',
    \ 'texthl': 'WarningMsg',
    \ }
  
  let g:neomake_error_sign = {
    \ 'text': 'X',
    \ 'texthl': 'ErrorMsg',
    \ }
  
":  Search
  set ignorecase
  set smartcase

":  Syntax
  syntax on
  syntax enable

" Object Loader
function! ReadObject(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" Load External Objects
call ReadObject('~/.config/nvim/object/archivedit.vim')
call ReadObject('~/.config/nvim/object/instant_mltype.vim')
call ReadObject('~/.config/nvim/object/netrw.vim')
