local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- defaults
    'tpope/vim-sensible',

    -- language server installer
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- autocompletion
    'hrsh7th/nvim-cmp',
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'rafamadriz/friendly-snippets',
        }
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lua',

    'onsails/lspkind-nvim',  -- vscode like pictograms
    'folke/which-key.nvim',
    'neovim/nvim-lspconfig', -- lsp
    'nvimdev/lspsaga.nvim',  -- lsp ui

    {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    },

    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-lua/plenary.nvim',

    -- Neoconf
    { 'folke/neoconf.nvim',        cmd = 'Neoconf' },

    -- Surround
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    { 'numToStr/Comment.nvim',     lazy = false, },                                                              -- commenting
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },                           -- lualine
    { 'junegunn/fzf',              dir = '~/.fzf',                                  build = './install --all' }, -- fuzzy finding
    'alexghergh/nvim-tmux-navigation',                                                                           -- tmux navigator
    'Mofiqul/vscode.nvim',                                                                                       -- vscode dark theme
    'm4xshen/autoclose.nvim',                                                                                    -- auto close
    'simrat39/rust-tools.nvim',                                                                                  -- rust tools
    {
        'folke/zen-mode.nvim',
        opts = {
            tmux = { enabled = false }, -- disables the tmux statusline
            kitty = {
                enabled = false,
                font = '+4', -- font size increment
            },
        }
    }, --zen mode
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        version = '^1.0.0',
    }, -- barline
})
