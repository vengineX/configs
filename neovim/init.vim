" vengent.io: lightweight init.vim
" --------------------------------------
" Required Dependencies:
"   - pip install neovim
"   - pip install pynvim

" --- Vim-Plug (Self-installing upon non-detection.)  
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter + PlugInstall | source $MYVIMRC
endif

" --- Index of Plugins --- >
call plug#begin('~/.config/nvim/plugged') 
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
 autocmd VimEnter * PlugInstall | q
endif

" --- Appearence 
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

" --- Functionality
  Plug 'troydm/zoomwintab.vim'
  Plug 'kien/ctrlp.vim'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'c-brenn/phoenix.vim'
  Plug 'tpope/vim-projectionist'
  Plug 'slashmili/alchemist.vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'nvie/vim-flake8'

  " > Code Folding
    Plug 'tmhedberg/SimpylFold'

  " Completions
    Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" --- Lang. & Development
  " Java 
    Plug 'sbdchd/neoformat'
    Plug 'artur-shaik/vim-javacomplete2'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'neomake/neomake'
  
  " JavaScript 
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
    
    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
  
  " Markdown / Live Preview
    Plug 'iamcco/mathjax-support-for-mkdp'
    Plug 'iamcco/markdown-preview.vim'
 
  " Python
    Plug 'vim-scripts/indentpython.vim'

call plug#end()

" --- Appearence 
if has ('gui_running')
  set termguicolors
  set background=dark
  colorscheme hashpunk-sw
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
else
  set termguicolors
  colorscheme plain
endif

" --- Code Folding
  nnoremap <space> za
  set foldmethod=indent
  set foldlevel=50
  let g:SimpylFold_docstring_preview=1

" --- Deoplete 
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#omni_patterns = {}
  let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
  let g:deoplete#sources = {}
  let g:deoplete#sources._ = []
  let g:deoplete#file#enable_buffer_path = 1
  ":> Java Completion
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
  ":> NeoMake
    autocmd! BufWritePost,BufEnter * Neomake
  ":> NeoFormat
    augroup astyle
      autocmd!
      autocmd BufWritePre * Neoformat
    augroup END

" --- Linting
  let g:ale_linters = {
  \   'python': ['flake8', 'pylint'],
  \   'javascript': ['eslint'],
  \   'vue': ['eslint']
  \}
  
  let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier']
  \}
  
  let g:ale_fix_on_save = 1
  let g:jsx_ext_required = 1

" --- Status Line
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_theme = 'lucius'

" --- Functionality
  set number
  set hidden
  set mouse=a
  set noshowmode
  set noshowmatch
  set nolazyredraw

" --- Backup & Recovery
  set nobackup
  set noswapfile
  set nowritebackup

" --- Indentation & Formatting
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  
  " > Ind: FullStack
  au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

  " > Ind: Python 
  au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
  let python_highlight_all=1

" --- Plugins
  nnoremap <Leader>o :CtrlP<CR>
  nnoremap <Leader>b :CtrlPBuffer<CR>
  nnoremap <Leader>f :CtrlPMRUFiles<CR>
  
" --- Search
  set ignorecase
  set smartcase

" --- Object Loader
  function! ReadObject(file)
    if filereadable(expand(a:file))
      exe 'source' a:file
    endif
  endfunction

" --- Load External Objects
  call ReadObject('~/.config/nvim/object/archivedit.vim')
  call ReadObject('~/.config/nvim/object/instant_mltype.vim')
  call ReadObject('~/.config/nvim/object/netrw.vim')
