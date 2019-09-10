" file: ~/.config/nvim/init.vim
" -----------------------------------------------------------------------------
" vengent.io: lightweight init.vim
" URL: http://nvim.vengent.io
" -----------------------------------------------------------------------------

let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path . 
    \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  execute 'source ' . fnameescape(autoload_plug_path)
  let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin() 
": Plugins: Appearence
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

": Plugins: Functionality
Plug 'kien/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'
Plug 'tmhedberg/SimpylFold'
Plug 'slashmili/alchemist.vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'neomake/neomake', { 'on': 'Neomake' }
let g:deoplete#enable_at_startup = 1
Plug 'nvie/vim-flake8'

": Plugins: Lang.
Plug 'sheerun/vim-polyglot'

": 	  : JavaScript
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

":        : Typescript 
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi'
Plug 'mhartington/deoplete-typescript'
call plug#end()

": Neovim Settings
" ------------------------------------------------------------------------------
if plug_install
  PlugInstall --sync
endif
unlet plug_install

": Settings: Appearence 
if has ('gui_running')
  set background=dark
  colorscheme hashpunk-sw
else
  colorscheme Monosvkem
endif 

if has ("termguicolors")
  set termguicolors
endif

if has ("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

": Settings: Backup
set nobackup
set noswapfile
set nowritebackup

": Settings: Completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

": Settings: Formatting
noremap <F3> :Autoformat<CR>

": Settings: Indentation 
set shiftwidth=2
set softtabstop=2
set expandtab

": Settings: Plugins
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

": Settings: Search
set ignorecase
set smartcase

": Settings: Syntax
syntax on
syntax enable

": Settings: Variables
let object_dir = '$HOME . "/.config/nvim/object"'

": Functions: ImportObj
function! ImportObj(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

": Imports:
call ImportObj(object_dir . "/netrw.vim")
call ImportObj(object_dir . "/instant_mltype.vim")

