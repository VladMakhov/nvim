vim.api.nvim_set_keymap('n', 'tt', ':TransparentToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'qq', '<Esc>l', { noremap = true })
vim.api.nvim_set_keymap('i', 'QQ', '<Esc>l', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Del>', '<Esc>ldwi', { noremap = true })
vim.api.nvim_set_keymap('n', '@', ":let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>*", { noremap = true })
vim.api.nvim_set_keymap('n', '#', ":let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>#", { noremap = true })
vim.api.nvim_set_keymap('n', 'ff', ':nohlsearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'q', 'u', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<S-TAB>"', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'zz', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'H', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', 'w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'L', 'w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', 'mm', vim.cmd.UndotreeToggle)
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
vim.o.scrolloff = 8
vim.o.undofile = true
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.o.background = 'dark'

