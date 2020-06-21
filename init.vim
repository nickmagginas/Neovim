" Leader
let mapleader = " "

" Init
nnoremap <leader>c :vsp ~/.config/nvim/init.vim<CR>
autocmd! bufwritepost ~/.config/nvim/init.vim source %

" Line Numbers
set nu
set relativenumber

" Package Manager
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'SkyLeach/pudb.vim'
Plug 'airblade/vim-gitgutter'
Plug 'voldikss/vim-floaterm'
call plug#end()


let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>b :Buffers<CR>

" Indenting Visual Selection
vnoremap < <gv
vnoremap > >gv

" Remap Escape
inoremap jj <Esc>
vnoremap q <Esc>

" Quiting
nnoremap <leader>q :wq<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>qq :wqa<CR>

" Saving
nnoremap <leader>w :w<CR>

" Ale
let g:ale_set_highlights = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '|'
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black']}
let g:ale_fix_on_save = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=blue
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

" Coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <leader>r :CocCommand python.execInTerminal<CR>
nmap <leader>rn <Plug>(coc-rename)
set hidden
set nobackup
set nowritebackup
set cmdheight=1

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Mypy
nnoremap <leader>mc :vsp ~/.config/mypy/config<CR>

" NerdTree
map <leader>t :NERDTreeToggle<CR>

set encoding=UTF-8

" Startify
let g:startify_custom_header = [
	\ '   _        _______  _______          _________ _______ ',
	\ '  ( (    /|(  ____ \(  ___  )|\     /|\__   __/(       )',
	\ '  |  \  ( || (    \/| (   ) || )   ( |   ) (   | () () |',
	\ '  |   \ | || (__    | |   | || |   | |   | |   | || || |',
	\ '  | (\ \) ||  __)   | |   | |( (   ) )   | |   | |(_)| |',
	\ '  | | \   || (      | |   | | \ \_/ /    | |   | |   | |',
	\ '  | )  \  || (____/\| (___) |  \   /  ___) (___| )   ( |',
	\ '  |/    )_)(_______/(_______)   \_/   \_______/|/     \|',
        \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
	\ {'c': '~/.config/nvim/init.vim'},
	\ {'d': '~/dev'},
	\ {'b': '~/.bashrc'}
	\ ]

" Tab switch
nnoremap <Tab> gt

" Theme

let g:dark = {}
let g:dark.black    =  [0,  '#22262e']
let g:dark.magenta  =  [5,  '#a093c7']
let g:none          = ["none", "none"]

function! g:C(scope, bg, fg, attr)
  exec "hi ".a:scope "ctermbg=".a:bg[0] "ctermfg=".a:fg[0] "cterm=".a:attr "guibg=".a:bg[1] "guifg=".a:fg[1] "gui=".a:attr
endfunction

call g:C("VertSplit",    g:none,            g:dark.black,     "none")
call g:C("SignColumn",   g:none,            g:dark.black,     "none")

function! LocateInterpreter()
	let l:check_dir = getcwd()
	let i = 0
	while i <= 20
		let l:exists = isdirectory(l:check_dir . '/bin')
		if l:exists
			return l:check_dir . '/bin'
		endif
		let l:check_dir = l:check_dir . '/..'
		let i += 1
	endwhile
endfunction

function! PyRun()
	let l:closest_bin = LocateInterpreter()
	let l:activate_path = l:closest_bin . '/activate'
	let l:is_env = filereadable(l:activate_path)
	if l:is_env
		execute 'FloatermNew! --name=python_exe --hight=0.6 --width=0.4 --position=topright source ' . l:activate_path . '; ' . 'python ' . @%
	else
		execute 'FloatermNew! python ' . @%
	endif
	" execute 'FloatermNew! source ../bin/activate ; python ' . @%
endfunction

function! PyDebug()
	let l:closest_bin = LocateInterpreter()
	let l:activate_path = l:closest_bin . '/activate'
	let l:is_env = filereadable(l:activate_path)
	if l:is_env
		execute 'FloatermNew! --name=python_de --hight=0.6 --width=0.4 --position=topright source ' . l:activate_path . '; ' . 'python -m pudb ' . @%
	else
		execute 'FloatermNew! python -m pudb ' . @%
	endif
	" execute 'FloatermNew! source ../bin/activate ; python ' . @%
endfunction

nnoremap <leader>r :call PyRun()<CR>
nnoremap <leader>d :call PyDebug()<CR>
tnoremap <leader><Tab> <C-\><C-n>:FloatermToggle<CR>
nnoremap <leader><Tab> :FloatermToggle<CR>
tnoremap <leader>jj <C-\><C-n>

" ColorColumn
autocmd FileType python set colorcolumn=100
highlight ColorColumn ctermbg=5
