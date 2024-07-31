"	### Set Utils ###"
"
let g:polyglot_disabled = ['markdown']
set number
set mouse=a
set noswapfile
set nocompatible
set ts=4
set encoding=UTF-8

"	### Plugin ####"
call plug#begin('~/.vim/plugged')

"	### Fancing starting page ###"
	Plug 'mhinz/vim-startify'

"	### Auto Complete ###:"
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

"	### NerdTree with icons ###"
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'

"	### Sercher for files ###"
	Plug 'nvim-telescope/telescope.nvim'

"	### Syntax for assambly ###"
	Plug 'vim-scripts/asmx86_64'
	Plug 'good5dog5/arm.vim'

" 	### Color scheme and vim airline ###"
 	Plug 'flazz/vim-colorschemes'
 	Plug 'morhetz/gruvbox'
	Plug 'sainnhe/vim-color-forest-night'
	Plug 'junegunn/seoul256.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

"	### Syntax color for different texts ###
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'
	Plug 'jaxbot/semantic-highlight.vim'

"	### Header 42 ###"
	Plug 'pbondoer/vim-42header'

"	### Geter for git to vim ###"
	Plug 'tpope/vim-fugitive'

call plug#end()

"	### Vim-theme ###"
if has('termguicolors')
	set termguicolors
endif

colorscheme everforest
set background=light
let g:everforest_background='soft'


"	### Coc config ###"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
	set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Manage extensions.
nnoremap <leader>cm :CocList<CR>

let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pyright',
	\ 'coc-htmldjango',
	\ 'coc-json', 
	\ 'coc-docker', 
	\ ]

"	### Bookmakrs for fancy starter ###"
let g:startify_bookmarks = [
	\ { 'z' : '~/.zshrc' },
	\ { 'v' : '~/.vimrc' },
	\ { 'n' : '~/.config/nvim/init.vim' },
	\ { 'b' : '~/.bashrc' },
	\ ]

"	#### Vim-airline ###"
set ttimeoutlen=50
let g:airline_theme='tomorrow'
let g:airline#extensions#branch#enabled=1

"	### UserLog for header ###"
let g:user42 = 'mjulliat'
let g:mail42 = 'mjulliat@student.42.ch'

"	### Space bar as <leader> ###"
nnoremap <SPACE> <Nop>
let	mapleader=" "

"	### auto close nerdtree ###"
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"	### Maping of the navigation folder ###"
nnoremap <leader>pv :Ex<CR>

"	### Maping of Semantic assambly ###"
nnoremap <leader>sa :set syntax=asmx86_64<CR>

"	### Maping of Semantic Highlight ###"
nnoremap <leader>ss :SemanticHighlightToggle<CR>

"	### maping of nerdtree ###"
nnoremap <leader>t  :NERDTreeToggle<CR>
nnoremap <leader>nf  :NERDTreeFind<CR>
nnoremap <Leader>nr :NERDTreeRefreshRoot<CR>

"	### maping of telescope ###"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
