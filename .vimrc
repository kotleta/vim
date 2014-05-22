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

set encoding=utf-8
set fileencodings=utf8,cp1251

sy on
set nu

"Titles, statuses
set title
set hlsearch
set ignorecase

set t_Co=256
"set t_Co=16
colorscheme wombat256
"colorscheme gardener

" по Ctrl+p форматирование perl-кода под стандарты заданые в perltidy
"map <C-p> :% ! perltidy<CR>

" по звездочке не прыгать на следующее найденное, а просто подсветить
nnoremap * *N

" выключить подсветку: повесить на горячую клавишу Ctrl+n
nnoremap <C-n> :nohlsearch<CR>

" в визуальном режиме по команде * подсвечивать выделение
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" Tab is Next window
nnoremap <Tab> <C-W>w

" Shift-Tab is Previous window
nnoremap <S-Tab> <C-W>W

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
