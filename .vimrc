"" for macvim
"" updated: 20221126

if has("gui_running")
    set gfn=Menlo-Regular:h18
    set lines=35 columns=90
    winp 140 20
    colorscheme desert
    set guioptions-=r
    set guioptions+=k
    set transparency=10  " set it at .gvimrc
endif

set shortmess=atl   " set it at .gvimrc, and i don't know why it not working at terminal
syntax enable
set nocp
set mouse=a
set nu
set ru
set rnu
set cul
set cuc
set ts=4
set sw=4
set sts=4
set et
"set list
set backspace=indent,eol,start
set hls
set ic
set scs    " smartcase
set is    " incsearch
set sm    " showmatch
set smd    " showmode
set sc    " showcmd
set ai
set fen    " foldenable
"set fdm=indent
set wrap
set whichwrap=b,s,<,>,[,]
set wildmenu
set ls=2
"set stl=%<%f\%w%h%m%r\ [%{&ff}/%Y]
set acd
set showtabline=1
set clipboard^=unnamed,unnamedplus

autocmd BufWritePost $MYVIMRC source $MYVIMRC
"let g:Powerline_colorscheme='solarized256'

filetype plugin on
au VimEnter,BufNewFile,BufRead * if &ft == '' && @% == '' | set ft=markdown | endif
"inoremap <ESC> <ESC>:set iminsert=2<CR>

call plug#begin()
Plug 'preservim/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-clangd',
            \'coc-prettier',
            \'coc-xml',
            \'coc-syntax',
            \'coc-git',
            \'coc-marketplace',
            \'coc-highlight',
            \'coc-sh',
            \]
