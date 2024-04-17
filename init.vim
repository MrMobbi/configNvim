"	### Set Utils ###"
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

"	### Intendent line ###"

"	### Auto Complete ###:"
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

"	### NerdTree with icons ###"
	Plug 'preservim/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'

"	### Sercher for files ###"
	Plug 'nvim-telescope/telescope.nvim'

" 	### Color scheme and vim airline ###"
 	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

"	### Syntax color for different texts ###
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'

"	### Header 42 ###"
	Plug 'pbondoer/vim-42header'

"	### Geter for git to vim ###"
	Plug 'tpope/vim-fugitive'

call plug#end()

"	### Vim-theme ###"
if has('termguicolors')
	set termguicolors
endif

colorscheme gruvbox

set background=light

"	### Coc config ###"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use K to show documentation in preview window.

" Manage extensions.
nnoremap <leader>cm <cmd>CocList<CR>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pyright',
  \	'coc-htmldjango',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-clangd', 
  \ 'coc-docker', 
  \ ]

"	### Indent Option ###"

"	### Bookmakrs for fancy starter ###"
let g:startify_bookmarks = [
		\ { 'z' : '~/.zshrc' },
		\ { 'v' : '~/.vimrc' },
		\ { 'n' : '~/.config/nvim/init.vim' },
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

"	### maping of nerdtree ###"
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tf :NERDTreeFind<CR>
nnoremap <Leader>tr :NERDTreeRefreshRoot<CR>

"	### j/k will move virtual lines (lines that wrap) ###"
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

"	### maping of telescope ###"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
