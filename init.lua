vim.api.nvim_set_keymap('n', 'tt', ':lua tsp()<CR>', { noremap = true })

vim.api.nvim_set_keymap('i', 'qq', '<Esc>l', { noremap = true })
vim.api.nvim_set_keymap('i', 'QQ', '<Esc>l', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Del>', '<Esc>ldwi', { noremap = true })

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
vim.api.nvim_set_keymap('v', 'H', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', 'w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'L', 'w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', 'k', { noremap = true, silent = true })

vim.keymap.set('n', 'mm', vim.cmd.UndotreeToggle)

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
vim.o.scrolloff = 8 
vim.o.undofile = true
vim.o.mouse = 'a'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.g.undotree_SplitWidth = 30

-- Normal mode mapping for 'a'
-- vim.api.nvim_set_keymap('n', 'a', 'i', { noremap = true })

-- Plugin management with vim-plug

vim.cmd([[
call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ThePrimeagen/vim-be-good'
Plug 'daltonmenezes/aura-theme', { 'rtp': 'packages/neovim' }
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'windwp/nvim-autopairs'
Plug 'Mofiqul/vscode.nvim'
Plug 'https://github.com/folke/tokyonight.nvim'
Plug 'numToStr/Comment.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'https://github.com/mbbill/undotree'
Plug 'rose-pine/neovim'

call plug#end()

colorscheme rose-pine-main
set background=dark
]])

-- Plug 'tribela/transparent.nvim'
-- vim.g.transparent_enabled = 0

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require('Comment').setup()

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

local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        -- java = false,-- don't check treesitter on java
    }
})

-- Integrate with coc.nvim
npairs.add_rules({
    Rule("(", ")", "lua")
        :with_pair(cond.not_after_regex_check("%%"))
        :with_pair(cond.not_before_regex_check("xxx", 3))
        :with_move(cond.none())
        :with_del(cond.none())
        :with_cr(cond.none())
})

-- If you want insert `(` after select function or method item
local remap = vim.api.nvim_set_keymap
_G.MUtils= {}

MUtils.completion_confirm=function()
    if vim.fn["coc#pum#visible"]() ~= 0 then
        return vim.fn["coc#_select_confirm"]()
    else
        return npairs.autopairs_cr()
    end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})


-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'

local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
-- require('vscode').load()

-- load the theme without affecting devicon colors.
-- vim.cmd.colorscheme "vscode"



require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "c_sharp", "typescript", "css", "html", "java"},

  sync_install = false,

  auto_install = true,

  -- ignore_install = { "javascript" },


  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}

-- Функция для установки фиксированной ширины undotree
local function set_undotree_width()
vim.cmd('vertical resize 50')
end

-- Функция для установки фиксированной высоты diffpanel_3
local function set_diffpanel_height()
vim.cmd('resize 20')
end

-- Автокоманда для установки ширины при открытии undotree
vim.api.nvim_create_autocmd('BufWinEnter', {
pattern = 'undotree_*',
callback = set_undotree_width,
})

-- Автокоманда для установки ширины при изменении размера окна
vim.api.nvim_create_autocmd('VimResized', {
pattern = '*',
callback = function()
    if vim.fn.bufname() == 'undotree' then
     set_undotree_width()
    end
end,
})

-- Автокоманда для установки высоты при открытии diffpanel_3
vim.api.nvim_create_autocmd('BufWinEnter', {
pattern = 'diffpanel_3',
callback = set_diffpanel_height,
})

-- Автокоманда для установки высоты при изменении размера окна
vim.api.nvim_create_autocmd('VimResized', {
pattern = '*',
callback = function()
    if vim.fn.bufname() == 'diffpanel_3' then
     set_diffpanel_height()
    end
end,
})

local is_transparent = false

function tsp(color)
    color = color or "rose-pine-main"
    vim.cmd.colorscheme(color)

    if is_transparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = vim.api.nvim_get_hl_by_name("Normal", true).background })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = vim.api.nvim_get_hl_by_name("NormalFloat", true).background })
    else
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end

    is_transparent = not is_transparent
end

