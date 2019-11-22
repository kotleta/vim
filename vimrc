scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf8,cp1251

" add more plugins
" https://github.com/tpope/vim-pathogen
" https://github.com/tpope/vim-commentary
" https://github.com/scrooloose/nerdtree
" https://github.com/ctrlpvim/ctrlp.vim
" https://github.com/tpope/vim-fugitive
execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
set background=dark
colorscheme wombat256
set t_ut=

"tab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set expandtab       " Change tabs to spaces

" This is for vertical indenting
set list
"set listchars=tab:\|-,eol:·,precedes:«,extends:»
set listchars=tab:\|·,precedes:«,extends:»,trail:·
"NOTE the space char after last backslash.

" autocmd vimenter * NERDTree
" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeToggle<CR>:vertical res 30<CR>
" nmap <Leader>T :NERDTreeToggle<CR>
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let g:NERDTreeWinSize = 30

set runtimepath^=~/.vim/bundle/ctrlp.vim

sy on
set nu
set tabpagemax=20

" highlight after 100 symbol in line
highlight OverLine cterm=NONE ctermfg=black ctermbg=LightGrey
au BufWinEnter *.pl  let w:m1=matchadd('OverLine', '\%>100v.*', -1)
au BufWinEnter *.pm  let w:m1=matchadd('OverLine', '\%>100v.*', -1)
au BufWinEnter *.lua let w:m1=matchadd('OverLine', '\%>100v.*', -1)

"Titles, statuses
set title
set hlsearch
set incsearch
set ignorecase

" all numbers is 10
set nrformats=

set laststatus=2

set ttimeoutlen=50  " Make Esc work faster
set wildmenu        " Enable wildmenu
set wildmode=longest:full,full
set backspace=indent,eol,start  " proper backspacing


"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set statusline=%F       "full filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"highlight colomn and line
set cursorline cursorcolumn
hi CursorLine  cterm=NONE guibg=Grey40

" по Ctrl+p форматирование perl-кода под стандарты заданые в perltidy
"map <C-p> :% ! perltidy<CR>

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N

" выключить подсветку: повесить на горячую клавишу Ctrl+n
nnoremap <C-n> :nohlsearch<CR>

" в визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" mouse is active and visual
" set mouse=a
" map <S-Insert> <MiddleMouse>
" map! <S-Insert> <MiddleMouse>

" in cmd: path to current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Shortcut for :%s//
nnoremap <leader>s :%s//gc<left><left><left>
vnoremap <leader>s :s//gc<left><left><left>

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
