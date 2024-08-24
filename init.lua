vim.api.nvim_set_keymap('i', 'qq', '<Esc>l', { noremap = true })
vim.api.nvim_set_keymap('i', 'QQ', '<Esc>l', { noremap = true })
-- vim.api.nvim_set_keymap('i', '{', '{}<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Del>', '<Esc>ldwi', { noremap = true })

-- Normal mode mappings
vim.api.nvim_set_keymap('n', ',<space>', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>', '<C-y>', { noremap = true })

-- Highlight search and jump to next occurrence
vim.api.nvim_set_keymap('n', '@', ":let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>*", { noremap = true })
vim.api.nvim_set_keymap('n', '#', ":let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>#", { noremap = true })

-- Disable highlight search with 'ff'
vim.api.nvim_set_keymap('n', 'ff', ':nohlsearch<CR>', { noremap = true })

-- Undo with 'q'
vim.api.nvim_set_keymap('n', 'q', 'u', { noremap = true })

-- Telescope mappings
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

-- Insert mode mappings for completion
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<S-TAB>"', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<CR>"', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'zz', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', 'w', { noremap = true, silent = true })

-- Settings
vim.cmd('syntax on')
vim.o.swapfile = false
vim.o.encoding = 'utf-8'
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.hidden = true
vim.o.scrolloff = 7
vim.o.undofile = true
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false

-- Normal mode mapping for 'a'
vim.api.nvim_set_keymap('n', 'a', 'i', { noremap = true })

-- Plugin management with vim-plug
vim.cmd([[
call plug#begin('~/.config/nvim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tribela/transparent.nvim'
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

colorscheme gruvbox
set background=dark
]])

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
