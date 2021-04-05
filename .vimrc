" remember lines of history
set history=500

filetype plugin on

filetype indent on

" cursor always 7 lines above bottom / below top of screen
set so=7

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Autowrite when :make (thus :GoBuild from vim-go)
set autowrite

" Save on focusing away from Vim
au FocusLost * :wa

let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
    
" Fast quit
nmap <leader>q :q<cr>

" Fast Go Build
nmap <leader>b :GoBuild<cr>

" Fast Go Run
nmap <leader>g :GoRun<cr>

let g:go_term_enabled = 1
let g:go_term_mode = "silent keepalt rightbelow 15 split"
let g:go_def_reuse_buffer = 1
" Terminal settings

map <C-n> :cnext<cr>
map <C-m> :cprevious<cr>
nnoremap <leader>e :cclose<cr>

" Fast Go Test
nmap <leader>t :GoTest<cr>

" show the current command being executed
set showcmd

" show current mode
set showmode

" map Omnifunc 
inoremap <S-tab> <C-x><C-o>

" auto close the Omnifunc Preview window after leaving Insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" preferred view for the netrw File Explorer
let g:netrw_liststyle = 3
" remove dir banner 
let g:netrw_banner = 0


" relative line numbers
set relativenumber

syntax enable

" display options menu for commands (ie. color)
set wildmenu

" ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*

" show cursor x,y pos
set ruler

set cmdheight=1

" hide buffer when abandoned
set hidden

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" highlight current line
set cursorline

" ignore lower/upper case when searching
set ignorecase

" lowercase search both lower/upper, not vice versa
set smartcase

" highlight all search results
set hlsearch

" highlight search results as typing
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" fast terminal, more chars to screen for redrawing
set ttyfast

" show matching brackers for 2/10th sec
set showmatch
set matchtime=2

set encoding=utf8

" Use Unix as the standard file
set ffs=unix,dos

" Use spaces instead of tabs when pressing Tab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" auto indent / smart indent
set ai
set si

set wrap
set textwidth=79
set colorcolumn=85

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" search using Space
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><space> :noh<cr>

" Always show the status line
set laststatus=2
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" store history in .un~ file to undo even after reopen files
set undofile

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
