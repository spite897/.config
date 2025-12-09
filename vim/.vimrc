" ____    ____    ___   _____   _____ 
"/ ___|  |  _ \  |_ _| |_   _| | ____|
"\___ \  | |_) |  | |    | |   |  _|  
" ___) | |  __/   | |    | |   | |___ 
"|____/  |_|     |___|   |_|   |_____|
                                      
source ~/.config/vim/key-bindings-colemak.vim

call plug#begin('~/.vim/plugged')
      Plug 'itchyny/lightline.vim'
      Plug 'preservim/nerdtree'
      Plug 'vim-airline/vim-airline'
      "Plug 'Yggdroot/LeaderF'
      Plug 'mhinz/vim-startify'
      Plug 'connorholyday/vim-snazzy'
      Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
      Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
      Plug 'vimwiki/vimwiki'
      Plug 'godlygeek/tabular'
      Plug 'plasticboy/vim-markdown'
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim'
      Plug 'chomosuke/typst-preview.nvim', {'tag': 'v1.*'}
call plug#end()

let g:mkdp_browser = 'firefox'

filetype plugin on


let g:vimwiki_list = [{'path': '~/vNote/main', 'syntax': 'markdown', 'ext': '.md'},
                    \ {'path': '~/vNote/schoolwork', 'syntax': 'markdown', 'ext': '.md'},
                    \ {'path': '~/vNote/SFile', 'syntax': 'markdown', 'ext': '.md'}]


autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
    \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
    \ call fzf#vim#buffers(
    \   '',
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:0%', '?'),
    \   <bang>0)
    
command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({}, 'up:50%', '?'),
    \   1)
    
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(
    \   '',
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%', '?'),
    \   <bang>0)

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())


noremap ,/  I//<Esc>A//<cancel><Esc>
noremap ,t  A//<test><Esc>
noremap ,d  /<test><CR>I//<Esc>
noremap ,f  /<cancel><CR>I<Del><Del><Esc>

let g:SnazzyTransparent=1
let g:lightline={'colorscheme':'snazzy',}
set background=dark
colorscheme snazzy

set number
set nocompatible

syntax on
set ts=4
set cursorline
set wrap
set hlsearch
set autoindent
set expandtab
set foldenable
set foldmethod=syntax
set foldlevelstart=99
set incsearch
set relativenumber
let width=77


"echo -ne '\e[1 q' 
