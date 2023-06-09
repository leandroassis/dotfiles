:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set expandtab
:set hidden
:set scrolloff=8
:set updatetime=100
:set nobackup
:set nowritebackup
:set autoread
:set completeopt-=preview
:set mouse=a
:filetype on
:filetype plugin on
:filetype indent on

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim', { 'branch' : 'release' } " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/sainnhe/sonokai' " Sonokai Color Scheme
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'
Plug 'christoomey/vim-tmux-navigator'

set encoding=UTF-8

call plug#end()

" REMAP
nnoremap <C-b> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

noremap <silent> <c-h> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <c-j> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
noremap <silent> <c-k> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
noremap <silent> <c-l> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
noremap <silent> <c-p> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>

nmap <F8> :TagbarToggle<CR>
" END REMAP

" THEMES
:colorscheme sonokai
let g:sonokai_style = '𝐀𝐧𝐝𝐫𝐨𝐦𝐞𝐝𝐚'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_current_word = 'bold'
let g:sonokai_transparent_background = 0

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" END THEMES

" air-line
let g:airline_theme='sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" tmux-navigate
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_preserve_zoom = 1

" coc
let g:coc_global_extensions = ['coc-git', 'coc-clangd', 'coc-highlight', 'coc-sh', 'coc-perl', 'coc-jedi', 'coc-markdownlint', 'coc-prettier']