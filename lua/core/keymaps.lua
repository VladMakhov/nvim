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

-- vim.api.nvim_set_keymap('i', 'qq', '<Esc>:set relativenumber<CR>l', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'i', ':set norelativenumber<CR>i', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'a', ':set norelativenumber<CR>a', { noremap = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-a>', "ggVG")

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
vim.o.signcolumn = "yes:1"


-- Функция для вставки try-catch блока
local function insert_try_catch()
local start_line, start_col = unpack(vim.api.nvim_buf_get_mark(0, '<'))
local end_line, end_col = unpack(vim.api.nvim_buf_get_mark(0, '>'))

-- Получаем выделенный текст
local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

-- Добавляем try-catch блок
table.insert(lines, 1, "try")
table.insert(lines, 2, "{")
table.insert(lines, #lines + 1, "}")
table.insert(lines, #lines + 1, "catch (Exception ex)")
table.insert(lines, #lines + 1, "{")
table.insert(lines, #lines + 1, "    logger.Error(ex);")
table.insert(lines, #lines + 1, "}")

-- Заменяем выделенный текст на новый
vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, lines)

-- Автоиндентация вставленного блока
vim.api.nvim_command(string.format("%d,%dnormal! ==", start_line, end_line + 7))
end

-- Создаем команду для вызова функции
vim.api.nvim_create_user_command('InsertTryCatch', insert_try_catch, {})

-- Создаем бинд для визуального режима
vim.api.nvim_set_keymap('v', '<leader>tr', ':<C-u>InsertTryCatch<CR>5k', { noremap = true, silent = true })
