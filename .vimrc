"Forget compatibility with Vi
set nocompatible

"Required!
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Dependencies
Bundle 'gmarik/vundle'
Bundle 'tomtom/tlib_vim'

"General
"Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'tpope/vim-surround'
"Bundle 'AutoClose'
Bundle 'kien/ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/csapprox'
Bundle 'flazz/vim-colorschemes'
Bundle 'corntrace/bufexplorer'
Bundle 'myusuf3/numbers.vim'

"Programming
"PHP
Bundle 'spf13/PIV'
"Python
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'
"Javascript
Bundle 'leshill/vim-json'
"CSS
Bundle 'groenewege/vim-less'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
"HTML
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'taxilian/vim-web-indent'
"misc
Bundle 'tpope/vim-markdown'

"General
filetype plugin indent on
syntax enable
set mouse=a
scriptencoding utf-8

set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore

"Get rid of ugly scrollbars
set guioptions=aAce

"Ever notice a slight lag after typing the leader key + command? This lowers the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

set background=dark

"Set up directories
"set backup
if has('persistent_undo')
"    set undofile
    set undolevels=1000
    set undoreload=10000
endif

colorscheme earendel
set showmode                    " display the current mode
set showcmd

set encoding=utf-8
if has('mac')
    set guifont=Menlo:h12
else
    set guifont=ProggyCleanTTSZ:h12:cDEFAULT
    let g:Powerline_symbols = 'compatible'
endif

"Highlight current line
set cursorline
if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
    " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    "set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " backspace for dummies
set linespace=3                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " show matching brackets/parenthesis
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set smartindent
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set foldenable                  " auto fold code
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

"set nowrap                      " wrap long lines
set wrap!                       " don't wrap
set textwidth=79
set formatoptions=qrn1
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four columns
set softtabstop=4               " let backspace delete indent

autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

"Key (re)Mappings

"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ','


"Saves time; maps the spacebar to colon
nmap <space> :

"Map escape key to jj -- much faster
ino jj <esc>
cno jj <c-c>

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" The following two lines conflict with moving to top and bottom of the
" screen
" If you prefer that functionality, comment them out.
map <S-H> gT
map <S-L> gt

" Stupid shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

""" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map [F $
imap [F $
map [H g0
imap [H g0

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Easier horizontal scrolling
map zl zL
map zh zH

"Buffer explorer
nmap <leader>b :BufExplorer<CR>

"numbers
nnoremap <F3> :NumbersToggle<CR>

"ctrlp
let g:ctrlp_working_path_mode = 2
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }

if has('gui_running')
    set lines=50 columns=150                " 40 lines of text instead of 24,
    if has('gui_macvim')
        set transparency=5          " Make the window slightly transparent
        set go-=T                   " Hide MacVim toolbar by default
    endif
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    endif
    "set term=builtin_ansi       " Make arrow and other keys work
endif

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
    augroup myvimrchooks
        au!
        autocmd bufwritepost .vimrc source ~/.vimrc
    augroup END
endif
