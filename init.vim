call plug#begin()
  Plug 'tomasiser/vim-code-dark'
  Plug 'pangloss/vim-javascript'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'b3nj5m1n/kommentary'
  Plug 'tpope/vim-surround'
  Plug 'f-person/git-blame.nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()                 



" basic settings
syntax on
set modifiable 
set number relativenumber
set ignorecase    
set smartcase     
set nocompatible
set incsearch     
set visualbell
set expandtab
set tabstop=2
set ruler              
set smartindent
set shiftwidth=2
set hlsearch
set virtualedit=all
set backspace=indent,eol,start 
set autoindent
set wildmode 
set path+=**
set clipboard=unnamedplus
set nowrap

" set leader key to ,
let g:mapleader=","

" set normal mode key maps
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>4 :tabc<CR>
nnoremap <leader>w :only<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>b <c-^>
nnoremap <leader>gb :GitBlameToggle<CR>
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>f :Rg<CR>
nnoremap <leader>j :Buffers<CR>

" set escape shortcut in insert mode
inoremap jj <esc>

" " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <space>rf <Plug>(coc-rename)

colorscheme codedark
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },             
      \ }

