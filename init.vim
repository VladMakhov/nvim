inoremap qq <Esc>l
inoremap QQ <Esc>l

inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i
nnoremap ,<space> :nohlsearch<CR>


" Включение подсветки при поиске слова с помощью @ и прыжок к следующему вхождению
nnoremap @ :let @/='\<'.expand('<cword>').'\>'<CR>:set hlsearch<CR>*

" Отключение подсветки при вводе ff
nnoremap ff :nohlsearch<CR>

" Откат изменений c 'u' на 'q' 
nnoremap q u

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

syntax on

set noswapfile

set encoding=utf-8

" Better colors
set termguicolors

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
set number
set relativenumber

" columns used for the line number
set numberwidth=4

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" open splits intuitively
set splitbelow
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=7

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

set noshowmode

let g:matchup_matchparen_offscreen = {'method': 'popup'}

nnoremap a i

call plug#begin('~/.config/nvim/plugged')

Plug 'andymass/vim-matchup'

Plug 'gruvbox-community/gruvbox'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tribela/transparent.nvim'

call plug#end()

" declare your color scheme
colorscheme gruvbox
" Use this for dark color schemes
set background=dark
