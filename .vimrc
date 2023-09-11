
let mapleader = ","
" Fast saving
set number
set relativenumber
set autoread  " Set to auto read when a file is changed from the outside
set ruler     " Always show current position in status bar
set hid       " A buffer becomes hidden when it is abandoned
set smartcase " When searching try to be smart about cases
set hlsearch  " Highlight search results
set incsearch " Makes search act like search in modern browsers
set showmatch " Show matching brackets when text indicator is over them
set expandtab " On pressing tab, insert 4 spaces
set backspace=indent,eol,start
set laststatus=2                                  " Display the status line always
set history=500                                   " Sets how many lines of history VIM has to remember
set cmdheight=1                                   " Height of the command bar
set mat=2                                         " How many tenths of a second to blink when matching brackets
set foldcolumn=0                                  " Add a bit extra margin to the left
set tabstop=4                                     " show existing tab with 4 spaces width
set shiftwidth=4                                  " when indenting with '>', use 4 spaces width

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dev remap JS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Jcl oconsole.log();<Esc>hi
nnoremap Jrf Oreturn false;<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom remap

" nnoremap ss :grep -rnw './' -e '
inoremap jj <Esc>
nnoremap sS :Ack  
nnoremap tn :tabnew<Space>
nnoremap qq :wq<CR>
nnoremap <S-q> :q!<CR>
"nnoremap <S-w> :w<CR>:echo "Saved!"<CR>
nnoremap <C-w> :update<CR>
nnoremap <C-j> <S-%>
nnoremap <S-1> :!
nnoremap <S-s> :! grep -rnw './' -e '

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

"set ai "Auto indent
"set si "Smart indent
"set wrap "Wrap lines


