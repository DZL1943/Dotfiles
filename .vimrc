"" for macvim
"" updated: 20220917

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
set cul
set cuc
set ts=4
set sw=4
set sts=4
set et
"set list
set backspace=indent,eol,start
set hls
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
set stl=%<%f\%w%h%m%r\ [%{&ff}/%Y]
set acd
set showtabline=1

autocmd BufWritePost $MYVIMRC source $MYVIMRC
"let g:Powerline_colorscheme='solarized256'
