filetype plugin indent on

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

set encoding=utf8                                 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                              " Use Unix as the standard file type
set guifont=Inconsolata\ for\ Powerline
:set guicursor=i:blinkwait50-blinkon50-blinkoff50 " Sets the cursor blink speed
set rtp+=/usr/local/opt/fzf
set backspace=indent,eol,start
set laststatus=2                                  " Display the status line always
set history=500                                   " Sets how many lines of history VIM has to remember
set cmdheight=1                                   " Height of the command bar
set mat=2                                         " How many tenths of a second to blink when matching brackets
set foldcolumn=0                                  " Add a bit extra margin to the left
set tabstop=4                                     " show existing tab with 4 spaces width
set shiftwidth=4                                  " when indenting with '>', use 4 spaces width

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim controls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F4>  : GitGutterToggle<Enter>
nnoremap <F5>  : set relativenumber!<Enter> : set number!<Enter>
nmap     <F6>  : NERDTreeToggle<CR>

nnoremap ;     : FZF<CR>
xnoremap <c-t> : '<,'>Tab /

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'ycm-core/YouCompleteMe'
Plug 'ashisha/image.vim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCustomDelimiters = {
    \ 'sass': { 'left': '/*', 'right': '*/'}
\ }
highlight SignColumn ctermbg=none
let g:gitgutter_diff_relative_to = 'index'

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#82aad5 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = 'e'
let g:gitgutter_sign_removed = '-'

"easymotion
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
map <Leader> <Plug>

" Ack -> Ag
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" Automatically open & close quickfix window
autocmd QuickFixCmdPost [^l]* nested cwindow

" PHP Find Usage
function! PhpUsage(word)
    exe 'Ack "::' . a:word . '\(|>' . a:word . '\("'
endfunction

" PHP Find Implementations
function! PhpImplementations(word)
    exe 'Ack "implements.*' . a:word . ' *($|{)"'
endfunction

" PHP Find Subclasses
function! PhpSubclasses(word)
    exe 'Ack "extends.*' . a:word . ' *($|{)"'
endfunction

noremap <Leader>fi :call PhpImplementations('<cword>')<CR>
noremap <Leader>fe :call PhpSubclasses('<cword>')<CR>

noremap <Leader>fu :call PhpUsage('<cword>')<CR>

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:UltiSnipsExpandTrigger="<c-s>"

let g:UltiSnipsListSnippets="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:ycm_auto_hover=''

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"let g:pymode_lint_checkers = ['mccabe', 'pyflakes', 'pylint']
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ranges
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nothing here yet

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dev remap HTML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Hc a class=""<Left>
nnoremap Hcn a className=""<Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dev remap PHP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Pdi odie;<Esc>
nnoremap Ppf opublic function methodName(){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Ppfp opublic function methodName($params){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Ppfn opublic function methodName(Namespace $namespace){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Ppfnp opublic function methodName(Namespace $namespace, $params){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o

nnoremap Pii oif(){<Left><BS><Esc>ajuu}<Esc>kklla

nnoremap Pif oprivate function methodName(){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Pifp oprivate function methodName($params){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Pifn oprivate function methodName(Namespace $namespace){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Pifnp oprivate function methodName(Namespace $namespace, $params){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o

nnoremap Pof oprotected function methodName(){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Pofp oprotected function methodName($params){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Pofn oprotected function methodName(Namespace $namespace){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
nnoremap Pofnp oprotected function methodName(Namespace $namespace, $params){}<Esc>i<CR><BS><Esc>kf{i<CR><Esc>o
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dev remap Laravel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Pdd odd();<Esc>hi
nnoremap Prrj areturn response()->json($data, 200);<Esc>4b
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dev remap JS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Jcl oconsole.log();<Esc>hi
nnoremap JcL Oconsole.log();<Esc>hi
nnoremap JCl oconsole.log([]);<Esc>hi
nnoremap JCL Oconsole.log([]);<Esc>hi
nnoremap Jrf Oreturn false;<Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Dev remap JS React JS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap Rss othis.setState({: value});<Esc>F{a
nnoremap RsS Othis.setState({: value});<Esc>F{a
nnoremap Rts ithis.state.
nnoremap RtS ithis.state.
nnoremap Rcn i className=""<Esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom remap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
" autocmd FileType nerdtree setlocal relativenumber
" let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMapActivateNode = 'l'
let NERDTreeWinSize = 38 

" nnoremap ss :grep -rnw './' -e '
nnoremap sS :Ack  
inoremap jj <Esc>
nnoremap tn :tabnew<Space>
nnoremap qqq :wq<CR>
nnoremap <S-q> :q!<CR>
nnoremap <S-w> :w<CR>:echo "Saved!"<CR>
nnoremap qq :echo ""<CR>
nnoremap <C-j> <S-%>
nnoremap <S-1> :!
nnoremap <S-s> :! grep -rnw './' -e '

nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

let NERDTreeMapOpenInTab='<ENTER>'

"inoremap <C-H> <Left>
"inoremap <c-j> <down>
"inoremap <c-k> <up>
"inoremap <c-l> <right>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"g:gruvbox_contrast_dark='hard'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable filetype plugins
filetype plugin on
filetype indent on

" Fast saving
nmap <leader>w :w!<cr>

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    "let base16colorspace=256  " Access colors present in 256 colorspace
    "colorscheme desert
    "colorscheme base16-default-dark
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


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

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
execute pathogen#infect()
call pathogen#helptags()

if has("syntax")
  syntax on
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Garbage Dump
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set ignorecase " Ignore case when searching
"set magic "Simplifying regular expressions using magic and no-magic
"set signcolumn=yes
"set noerrorbells " No annoying sound on errors
"set novisualbell
"set t_vb=
"set tm=500
"vnoremap <leader>p "_dP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => My Dvorak bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap h h
" noremap H H
" noremap t j
" noremap T J
" noremap n k
" noremap N K
" noremap s l
" noremap S L
" noremap l n
" noremap L N
" noremap j t
" noremap J T
" noremap k s
" noremap K S

