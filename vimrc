scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf8,cp1251
" https://github.com/tpope/vim-commentary
" add more plugins
" execute pathogen#infect()
syntax on
" filetype plugin indent on

set t_Co=256
colorscheme wombat256

"tab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
" This is for vertical indenting
set list
"set listchars=tab:\|-,eol:·,precedes:«,extends:»
set listchars=tab:\|·,precedes:«,extends:»,trail:·
"NOTE the space char after last backslash.

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
set ignorecase

" all numbers is 10
set nrformats=

set laststatus=2

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


function! s:ToggleQuote()
	let q = searchpos("'", 'n', line('.'))
	let qb = searchpos("'", 'bn', line('.'))
	let dq = searchpos('"', 'n', line('.'))
	let dqb = searchpos('"', 'bn', line('.'))

	if q[0] > 0 && qb[0] > 0 && (dq[0] == 0 || dq[0] > q[0])
		execute "normal mzcs'\"`z"
	elseif dq[0] > 0 && dqb[0] > 0
		execute "normal mzcs\"'`z"
	endif
endfunction

nnoremap <silent>'  :<C-U>call <SID>ToggleQuote()<CR>

" mouse is active and visual
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" in cmd: path to current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
