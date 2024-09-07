local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'rose-pine/neovim'
    use 'windwp/nvim-autopairs'
    use 'tribela/transparent.nvim'
    use 'itchyny/lightline.vim'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    }
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'morhetz/gruvbox'
    if packer_bootstrap then
        require('packer').sync()
    end
end)
